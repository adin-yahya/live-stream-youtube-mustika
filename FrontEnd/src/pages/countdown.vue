<template>
  <div class="hero">
    <navigation-component></navigation-component>
    <div class="spacer_header"></div>
    <div class="container">
      <div class="row align-items-center justify-content-center block_thank_you">
        <div v-if="event" class="col-md-6">
          <!-- Heading -->
          <h2 class="mb-20">{{ event.event_name }}</h2>
          <h5 class="mb-30 text-primary">{{ event.date | moment("dddd, Do MMMM YYYY, h:mm:ss a") }}</h5>
          <!-- Text -->
          <p class="mb-40">{{ event.desc }}</p>
          <div v-if="showCountdown" class="block_timer">
            <vue-countdown :time="times" :interval="100" tag="div" class="flex center" @end="timeElapsedHandler">
              <template slot-scope="props">
                <div class="item">
                  <div class="number" id="days">{{ props.days }}<div>Hari</div>
                  </div>
                </div>
                <div class="dots">:</div>
                <div class="item">
                  <div class="number" id="hours">{{ props.hours }}<div>Jam</div>
                  </div>
                </div>
                <div class="dots">:</div>
                <div class="item">
                  <div class="number" id="minutes">{{ props.minutes }}<div>Menit</div>
                  </div>
                </div>
                <div class="dots">:</div>
                <div class="item">
                  <div class="number" id="seconds">{{ props.seconds }}<div>Detik</div>
                  </div>
                </div>
              </template>
            </vue-countdown>
          </div>
          <div v-else>
            <a @click="loginCheck(null)" class="btn btn-primary btn-lg btn-block" role="button">Login Live Meeting</a>
          </div>
        </div>
        <div class="col-md-6">
          <img class="img-fluid" src="/static/assets/images/countdown.png" alt="">
        </div>
      </div>
      <b-modal id="login-modals" hide-footer hide-header centered size="xl" body-class="p-0">
        <login-component @successLogedIn="loginCheck"></login-component>
      </b-modal>
    </div>
  </div>
</template>

<script>
import VueCountdown from '@chenfengyuan/vue-countdown'
import LoginComponent from '@/components/login'
export default {
  name: 'Countdown-Pages',
  components: {
    VueCountdown,
    LoginComponent,
    NavigationComponent: () => import('@/components/navigation'),
  },
  data () {
    return {
      showCountdown: true,
      times: null,
      event: null
    }
  },
  mounted () {
    this.$_sys.get('event/active').then(res => {
      if (res.data) {
        this.event = res.data
        this.setCountDown(res.data.date)
      } else this.$router.push({ name: 'not-found' })
    }).catch(error => {
       this.$router.push({ name: 'not-found' })
    })
  },
  methods: {
    setCountDown (e) {
      let now = new Date()
      let hold = new Date(e)
      this.times = hold - now
      this.showCountdown = Boolean(this.times > 0)
    },
    timeElapsedHandler () {
      this.showCountdown = false
    },
    loginCheck (e = null) {
      if (!e) this.$bvModal.show('login-modals')
      else {
        if (e.division_id === -1) this.$router.push({ name: 'admin-event' })
        else this.$router.push({ name: 'livestream' })
      }
    }
  }
}
</script>