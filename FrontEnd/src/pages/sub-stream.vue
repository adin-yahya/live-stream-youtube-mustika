<template>
  <div v-if="event" class="container mt-20">
    <div class="hero_wrap">
      <div class="row row-eq-height mb-80">
        <div class="col-lg-8">
          <youtube v-if="videoId" :video-id="videoId" player-width="100%" player-height="520" style="height:520px" :player-vars="{ autoplay: 1, rel:0 }" :mute="this.videoMuted" @ended="onreadyPlayer"></youtube>
          <div class="live-title mt-30 mb-50">
            <img src="/static/assets/images/sound.png" class="img-live mr-20">
            <div>
              <h5>{{ subStream.division_name }}</h5>
              <!-- <h6>Pembicara {{ subStream.speaker_name }}</h6> -->
            </div>
          </div>
          <div class="mb-40">
            <div v-for="(s,i) in JSON.parse(subStream.speaker_name)" :key="i+'-img-speaker-data'" class="c-customer-review-meta d-flex justify-content-start align-items-center mb-2">
              <div class="user">
                <img :src="s.photo" class="avatar avatar-sm rounded-circle">
              </div>
              <div class="meta ps-2">
                <p class="name">{{ s.name }}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="chat-wrapper" style="height:550px">
            <div class="chat-title">
              <div class="flex-fill" @click="activeTab = 'chat'">
                <h6 class="tab mx-2 pb-2 pointer" :class="activeTab == 'chat' ? 'active': ''">Live Chat</h6>
              </div>
              <div class="flex-fill" @click="activeTab = 'user'">
                <h6 class="tab mx-2 pb-2 pointer" :class="activeTab == 'user' ? 'active': ''">{{ participant.length }} Participant</h6>
              </div>
            </div>
            <div class="chat-body h-100">
              <live-comment v-if="activeTab === 'chat'" :event="event" :room="Number(id)"></live-comment>
              <participant v-if="activeTab === 'user'" :event="event" :room="Number(id)"></participant>
            </div>
          </div>
        </div>
      </div>
      <quote-component :id="event.id"></quote-component>
    </div>
    <b-modal id="zoom-link" size="lg" hide-footer hide-header centered :no-close-on-backdrop="true" :no-close-on-esc="true">
      <div class="p-5">
        <div class="section_head mb-lg-0 text-center">
          <!-- Preheading -->
          <h4 class="section_title text-center mb-20"> Acara Streaming Telah Berakhir </h4>
          <p class="section_description mb-0 max-40 mb-30">Selanjutnya anda bisa langsung menuju room Live Streaming untuk melanjutkan raingkaian acara {{ event.event_name }}</p>
          <router-link :to="{ name: 'livestream' }" class="btn btn-primary btn-outline sweep_letter sweep_top">
            <div class="inside_item">
              <span> Menuju Room Live Streaming </span>
            </div>
          </router-link>
        </div>
      </div>
    </b-modal>
  </div>
</template>
<style scoped>
  iframe {
    webkit-border-radius: 20px;
    -moz-border-radius: 20px;
    border-radius: 8px;
    margin: 0 auto;
    overflow: hidden;
  }
  .chat-title {
    display: flex;
    justify-content: space-between;
  }
  .tab {
    text-align: center;
    font-weight: 500;
  }
  .tab.active {
    border-bottom: 3px solid #687ded;
  }
  .live-title {
    display: flex;
    align-items: center;
  }
  .img-live {
    width: 50px;
    height: 20px;
  }
  .img-substream {
    width: 100%;
    height: auto;
  }
  .blog.has_style_grid.substream {
    border-radius: 8px;
    /* box-shadow: none; */
  }
  .blog .blog-wrap {
    margin: 0;
    padding: 10px;
  }
  .block-watch {
    display: flex;
    position: absolute;
    width: 100%;
    height: 100vh;
    top: 0;
    left: 0;
    background-color: #fff;
    z-index: 999;
    justify-content: center;
    align-items: center;
  }
</style>
<script>
import { getIdFromURL } from 'vue-youtube-embed'
export default {
  name: 'SubStream-Pages',
  props: {
    id: { required: true }
  },
  watch: {
    id: {
      immediate: true,
      handler (e) {
        if (this.userInfo.division_id === -1  || this.userInfo.division_id === 1 || e === this.userInfo.division_id) {
          this.$_sys.get('event/active').then(res => {
            this.event = res.data
            let ss = res.data.substream.filter(x => x.division_id == e)[0]
            if (ss) {
              this.subStream = ss
              this.videoId = getIdFromURL(ss.link)
              console.log(e)
              this.$bind('participant',
                this.$_user
                  .where('event_id', '==', res.data.id)
                  .where('room_id', '==', Number(e))
                  .where('sub_status', '==', 5)
                  .orderBy('date'))
              this.joinParticipant()
            } else {
              //if substream not found
              this.$router.push({ name: 'livestream' })
            }
          })
        } else {
          this.$router.push({ name: 'substream', params: { id: e } })
        }
      }
    }
  },
  components: {
    LiveComment: () => import('../components/comment'),
    Participant: () => import('../components/participant'),
    QuoteComponent: () => import('../components/quote')
  },
  data () {
    return {
      event: null,
      subStream: null,
      participant: [],
      userInfo: JSON.parse(localStorage.getItem('user-info')),
      videoId: null,
      videoMuted: false,
      times: null,
      activeTab: 'chat'
    }
  },
  created () {
    window.addEventListener('beforeunload', this.leaveParticipant)
  },
  beforeDestroy () {
    this.leaveParticipant()
  },
  methods: {
    async joinParticipant () {
      this.$_user.where('event_id', '==', this.event.id).where('user_ref', '==', this.userInfo.ref).get().then(querySnapshot => {
        const documents = querySnapshot.docs.map(doc => doc.data())
        if (documents.length == 0) {
          this.$_user.add({
            event_id: this.event.id,
            user_ref: this.userInfo.ref,
            username: this.userInfo.name,
            room_id: Number(this.id),
            live_status: 6,
            sub_status: 5,
            live_flag: 1,
            sub_flag: 1,
            date: new Date()
          })
        } else if (documents[0].sub_status == 6 || documents[0].room_id != this.id) {
          const id = querySnapshot.docs.map(doc => doc.id)
          this.$_user.doc(id[0]).set({
            event_id: this.event.id,
            user_ref: this.userInfo.ref,
            username: this.userInfo.name,
            room_id: Number(this.id),
            live_status: 6,
            sub_status: 5,
            live_flag: 1,
            sub_flag: 1,
            date: new Date()
          })
        }
      })
    },
    async leaveParticipant () {
      if (this.event)
        this.$_user.where('event_id', '==', this.event.id).where('user_ref', '==', this.userInfo.ref).get().then(querySnapshot => {
          const documents = querySnapshot.docs.map(doc => doc.id)
          if (documents.length != 0) {
            this.$_user.doc(documents[0]).set({
              event_id: this.event.id,
              user_ref: this.userInfo.ref,
              username: this.userInfo.name,
              room_id: Number(this.id),
              live_status: 6,
              sub_status: 6,
              live_flag: 1,
              sub_flag: 1,
              date: new Date()
            })
          }
        })
    },
    getThumbnail (e) {
      let id = getIdFromURL(e)
      return 'http://img.youtube.com/vi/' + id + '/0.jpg'
    },
    onreadyPlayer (e) {
      this.$bvModal.show('zoom-link')
    }
  }
}
</script>