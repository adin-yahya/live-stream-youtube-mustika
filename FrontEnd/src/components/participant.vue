<template>
  <div v-if="event" class="comment-container">
    <div class="comment-wrapper" v-chat-scroll>
      <div v-for="(chat, i) in participant" :key="i+'-ch'" class="comment">
        <div class="comment-header">
          <span class="username">
              <span class="numbering pe-2">{{ zeroPad(i+1) }}.</span> {{ chat.username }}
          </span>
          <span class="separator-title"></span>
          <timeago :datetime="new Date(chat.date.seconds * 1000)" :autoUpdate="true"></timeago>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
  .comment-container {
    height: 100%;
  }
  .comment-wrapper {
    overflow-y: auto;
    height: 80%;
  }
  .comment {
    margin: 1.25em 1em;
    font-size: 12px;
  }
  .comment-header {
    display: flex;
  }
  .username {
    font-weight: bold;
  }
  .numbering {
    display: inline-block;
    width: 2.5em;
  }
  .separator-title {
    display: inline-block;
    width: 7px;
    height: 7px;
    margin: auto 10px;
    border-radius: 50%;
    background-color: #687ded;
  }
  .form-comment,
  .form-comment:focus {
    font-size: 14px;
    padding: 10px;
    margin: 0;
    box-shadow: none;
    border: none;
    border-bottom: 2px solid;
    border-radius: 0;
    border-color: rgba(104, 125, 237, 0.5);
  }
  .append-comment {
    color: #687ded;
    border: none;
    font-size: 20px;
  }
</style>
<script>
export default {
  name: 'participant-component',
  data () {
    return {
      participant: null,
      user: JSON.parse(localStorage.getItem('user-info')),
      messages: ''
    }
  },
  watch: {
    room: {
      immediate: true,
      handler (room) {
        let field = room == -1 ? 'live_status' : 'sub_status'
        if (this.event)
          this.$bind('participant',
            this.$_user
              .where('event_id', '==', this.event.id)
              .where('room_id', '==', Number(room))
              .where(field, '==', 5)
              .orderBy('date'))
      }
    }
  },
  props: {
    room: { type: Number, required: false, default: -1 },
    event: { type: Object, required: true }
  },
  methods: {
    getEvent () {
      this.$_sys.get('event/active').then(res => {
        this.event = res.data
      })
    },
    zeroPad (num, places = 2) {
      let zero = places - num.toString().length + 1
      return Array(+(zero > 0 && zero)).join("0") + num
    }
  }
}
</script>
