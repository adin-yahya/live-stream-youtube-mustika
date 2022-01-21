<template>
  <div v-if="event" class="comment-container">
    <div class="comment-wrapper" v-chat-scroll>
      <div v-for="(chat, i) in livechat" :key="i+'-ch'" class="comment">
        <div class="comment-header">
          <span class="username text-primary">{{ chat.username }}</span>
          <span class="separator-title"></span>
          <timeago :datetime="new Date(chat.date.seconds * 1000)" :autoUpdate="true"></timeago>
        </div>
        <div class="comment-body"> {{ chat.msg }} </div>
      </div>
    </div>
    <div v-if="send" class="input-group mt-10">
      <input type="text" v-model.trim="messages" v-on:keyup.enter="addChat" class="form-control form-comment" placeholder="Kirim pesan untuk semuanya">
      <div class="input-group-append pointer" @click="addChat">
        <span class="input-group-text append-comment"><i class="ri-send-plane-2-line"></i></span>
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
    height: calc(100% - 40px);
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
  name: 'comment-component',
  data () {
    return {
      livechat: null,
      user: JSON.parse(localStorage.getItem('user-info')),
      messages: ''
    }
  },
  watch: {
    room: {
      immediate: true,
      handler (room) {
        if (this.event)
          this.$bind('livechat',
            this.$_chat
              .where('event_id', '==', this.event.id)
              .where('room_id', '==', room)
              .orderBy('date'))
      }
    }
  },
  props: {
    room: { type: Number, required: false, default: -1 },
    send: { type: Boolean, required: false, default: true },
    event: { type: Object, required: true },
  },
  methods: {
    async addChat () {
      if (this.messages) {
        let msg = this.messages
        this.messages = ''
        await this.$_chat.add({
          room_id: this.room,
          event_id: this.event.id,
          username: this.user.name,
          msg: msg,
          date: new Date()
        })

      }
    },
    getEvent () {
      this.$_sys.get('event/active').then(res => {
        this.event = res.data
      })
    }
  }
}
</script>
