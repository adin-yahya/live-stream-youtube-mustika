<template>
  <div class="container">
    <div class="hero_wrap">
      <div class="row">
        <div class="col-12 col-md-3">
          <div class="sidebar_account">
            <h6 class="font-weight-bold text-uppercase"> Event Menu </h6>
            <ul class="card-list list text-gray-700 mt-30">
              <li class="list-item ">
                <a class="list-link text-reset pointer" :class="view === 'info' ? 'is_active': ''" @click="changeView('info')">
                  <i v-if="view==='info'" class="ri-google-play-line me-2" style="font-size: 12px;"></i> Informasi Event </a>
              </li>
              <li class="list-item">
                <a class="list-link text-reset pointer" :class="view === 'statistic' ? 'is_active': ''" @click="changeView('statistic')">
                  <i v-if="view==='statistic'" class="ri-google-play-line me-2" style="font-size: 12px;"></i> Statistik Penonton</a>
              </li>
              <li class="list-item">
                <a class="list-link text-reset pointer" :class="view === 'history' ? 'is_active': ''" @click="changeView('history')">
                  <i v-if="view==='history'" class="ri-google-play-line me-2" style="font-size: 12px;"></i> Panel Live Chat</a>
              </li>
              <li class="list-item">
                <a class="list-link text-reset pointer" :class="view === 'quote' ? 'is_active': ''" @click="changeView('quote')">
                  <i v-if="view==='quote'" class="ri-google-play-line me-2" style="font-size: 12px;"></i> Kesan Pengguna </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-12 col-md-9">
          <event-form v-if="view==='info'" :id="this.$route.params.id"></event-form>
          <event-statistic v-if="view==='statistic'" :id="this.$route.params.id"></event-statistic>
          <event-chat v-if="view==='history'" :id="this.$route.params.id"></event-chat>
          <event-quote v-if="view==='quote'" :id="this.$route.params.id"></event-quote>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'admin-event-detail',
  props: ['id'],
  components: {
    eventForm: () => import('@/pages/admin-event-form'),
    eventStatistic: () => import('@/pages/admin-event-statistic'),
    eventChat: () => import('@/pages/admin-event-chat'),
    eventQuote: () => import('@/pages/admin-event-quote'),
  },
  watch: {
    '$route.query': {
      deep: true,
      immediate: true,
      handler (to) {
        this.view = to.view
      }
    }
  },
  data () {
    return {
      event: null,
      view: 'info'
    }
  },
  mounted () {
    this.$_sys.get('event/detail/' + this.$route.params.id).then(res => {
      this.event = res.data
    })
  },
  methods: {
    changeView (e) {
      this.$router.push({ query: { view: e } })
    }
  }
}
</script>

<style>
</style>