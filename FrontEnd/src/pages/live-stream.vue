<template>
  <div v-if="event">
    <div v-if="!isWaiting" class="container mt-20">
      <div class="hero_wrap">
        <div class="row row-eq-height mb-80">
          <div class="col-lg-8">
            <youtube v-if="videoId" :video-id="videoId" player-width="100%" player-height="520" style="height:520px" :player-vars="{ autoplay: 1, rel:0 }" :mute="this.videoMuted"></youtube>
            <div class="live-title mt-30 mb-50">
              <img src="/static/assets/images/sound.png" class="img-live mr-20">
              <h5>Live Stream {{ event.event_name }}</h5>
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
                <live-comment v-if="activeTab === 'chat'" :event="event"></live-comment>
                <participant v-if="activeTab === 'user'" :event="event"></participant>
              </div>
            </div>
          </div>
        </div>
        <div class="d-flex mb-30 flex-column">
          <h5>{{ event.event_name }} </h5>
          <vue-countdown v-if="!enabledSub" :time="times" :interval="100" tag="span" class="text-sm" @end="timeElapsedHandler">
            <template slot-scope="props">Hitung Mundur Substream {{ props.hours }} Jam {{ props.minutes }} Menit {{ props.seconds }} Detik</template>
          </vue-countdown>
        </div>
        <div class="row">
          <template v-for="(s,i) in event.substream">
          <div v-if="s.division_id != 1" class="col-md-4 col-lg-4 pointer" :key="i+'-substream'" @click="gotoSubs(s)">
            <div class="blog has_style_grid substream">
              <img :src="getThumbnail(s.link)" class="img-substream">
              <div class="blog-wrap">
                <h6>{{ s.division_name }}</h6>
                <p style="font-size:14px;" class="mt-1 mb-1">Pembicara:</p>
                <div v-for="(s,i) in JSON.parse(s.speaker_name)" :key="i+'-img-speaker-data'" class="c-customer-review-meta d-flex justify-content-start align-items-center mb-2">
                  <div class="user">
                    <img :src="s.photo" class="avatar avatar-sm rounded-circle">
                  </div>
                  <div class="meta ps-2">
                    <p class="name">{{ s.name }}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </template>
        </div>
        <quote-component :id="event.id"></quote-component>
      </div>
      <b-modal id="substream-timer" size="lg" hide-footer hide-header centered>
        <div class="p-5">
          <div class="section_head mb-lg-0 text-center">
            <!-- Preheading -->
            <template v-if="error === 1">
              <h4 class="section_title text-center">Hitung Mundur Substream</h4>
              <h2 class="section_title text-center">
                <vue-countdown v-if="times" :time="times" :interval="100" tag="div" class="flex center my-5" @end="timeElapsedHandler">
                  <template slot-scope="props"> {{ props.hours }} Jam {{ props.minutes }} Menit {{ props.seconds }} Detik</template>
                </vue-countdown>
              </h2>
              <p class="section_description mb-0  max-30"> Sub Stream akan dibuka sesuai bagian Anda setelah hitung mundur selesai</p>
            </template>
            <template v-if="error === 2">
              <h4 class="section_title text-center"> Anda tidak terdaftar dalam bagian ini </h4>
              <a @click="gotoSubs(userInfo)" class="btn btn-primary btn-outline sweep_letter sweep_top my-5">
                <div class="inside_item">
                  <span data-hover="Get free trial "> Arahkan ke {{ userInfo.division_name }} </span>
                </div>
              </a>
              <p class="section_description mb-0  max-30"> Anda hanya dapat mengakses video Sub Stream sesuai dengan jabatan Anda</p>
            </template>
          </div>
        </div>
      </b-modal>
    </div>
    <div v-else class="block-watch">
      <div>
        <h4 class="section_title text-center">Hitung Mundur Acara</h4>
        <h2 class="section_title text-center">
          <vue-countdown v-if="waitingTimes" :time="waitingTimes" :interval="100" tag="div" class="flex center my-5" @end="waitingTimeHandler">
            <template slot-scope="props"> {{ props.hours }} Jam {{ props.minutes }} Menit {{ props.seconds }} Detik</template>
          </vue-countdown>
        </h2>
      </div>
    </div>
  </div>
</template>
<style scoped>
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
  name: 'LiveStream-Pages',
  components: {
    LiveComment: () => import('../components/comment'),
    Participant: () => import('../components/participant'),
    VueCountdown: () => import('@chenfengyuan/vue-countdown'),
    QuoteComponent: () => import('../components/quote')
  },
  data () {
    return {
      event: null,
      participant: [],
      userInfo: JSON.parse(localStorage.getItem('user-info')),
      videoId: null,
      videoMuted: false,
      times: null,
      enabledSub: false,
      error: 1,
      activeTab: 'chat',
      isWaiting: true,
      waitingTimes: null,
    }
  },
  mounted () {
    this.$_sys.get('event/active').then(res => {
      this.event = res.data
      this.getWaitTime(res.data)
      this.videoId = getIdFromURL(res.data.livestream_link)
      if (res.data.sesion_limit_time) this.setCountDown(res.data)
      else {
        this.enabledSub = true
      }
      this.$bind('participant',
        this.$_user
          .where('event_id', '==', res.data.id)
          .where('room_id', '==', -1)
          .where('live_status', '==', 5)
          .orderBy('date'))
      this.joinParticipant()
    })
  },
  created () {
    window.addEventListener('beforeunload', this.leaveParticipant)
  },
  beforeDestroy () {
    this.leaveParticipant()
  },
  methods: {
    getWaitTime (data) {
      let time = new Date(data.date)
      let now = new Date()
      time.setMinutes(time.getMinutes() + data.waiting_time)
      this.waitingTimes = time - now
      this.isWaiting = Boolean(this.waitingTimes >= 0)
    },
    async joinParticipant () {
      this.$_user.where('event_id', '==', this.event.id).where('user_ref', '==', this.userInfo.ref).get().then(querySnapshot => {
        const documents = querySnapshot.docs.map(doc => doc.data())
        if (documents.length == 0) {
          this.$_user.add({
            event_id: this.event.id,
            user_ref: this.userInfo.ref,
            username: this.userInfo.name,
            room_id: -1,
            live_status: 5,
            sub_status: 6,
            live_flag: 1,
            sub_flag: 0,
            date: new Date()
          })
        } else if (documents[0].live_status == 6) {
          const id = querySnapshot.docs.map(doc => doc.id)
          this.$_user.doc(id[0]).set({
            event_id: this.event.id,
            user_ref: this.userInfo.ref,
            username: this.userInfo.name,
            room_id: -1,
            live_status: 5,
            sub_status: 6,
            live_flag: 1,
            sub_flag: 0,
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
              room_id: -1,
              live_status: 6,
              sub_status: 6,
              live_flag: 1,
              sub_flag: 0,
              date: new Date()
            })
          }
        })
    },
    setCountDown (e) {
      let now = new Date()
      let held = new Date(e.date)
      let time = e.sesion_limit_time
      let hold = new Date(held.getFullYear(), held.getMonth(), held.getDate(), time.split(':')[0], time.split(':')[1], time.split(':')[2])
      this.times = hold - now
      this.enabledSub = Boolean(this.times <= 0)
    },
    getThumbnail (e) {
      if (e) {
        let id = getIdFromURL(e)
        return 'http://img.youtube.com/vi/' + id + '/0.jpg'
      } else return '/static/assets/images/logo.png'
    },
    timeElapsedHandler () {
      this.enabledSub = true
    },
    waitingTimeHandler () {
      this.isWaiting = false
    },
    gotoSubs (e) {
      if (this.enabledSub) {
        // check division
        if (this.userInfo.division_id === -1 || this.userInfo.division_id === 1 || e.division_id === this.userInfo.division_id) {
          this.$router.push({ name: 'substream', params: { id: e.division_id } })
        } else {
          this.$bvModal.show('substream-timer')
          this.error = 2
        }
      } else {
        this.$bvModal.show('substream-timer')
        this.error = 1
      }
    }
  }
}
</script>