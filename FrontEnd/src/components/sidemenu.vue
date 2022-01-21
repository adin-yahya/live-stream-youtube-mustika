<template>
  <div v-if="userInfo.division_id === -1" class="side-options">
    <div class="wrap">
      <div class="item" @click="getActiveEvent()">
        <div class="link_item">Overview</div>
        <i class="ri-slideshow-line"></i>
      </div>
      <!-- <router-link v-if="activeEvent" :to="{ name: 'admin-event-detail', params: {id: activeEvent.id }, query: { view: 'statistic' } }" class="item" tag="div">
        <div class="link_item">Overview</div>
        <i class="ri-slideshow-line"></i>
      </router-link> -->
      <router-link :to="{ name: 'admin-event' }" class="item" tag="div">
        <div class="link_item">Event</div>
        <i class="ri-command-line"></i>
      </router-link>
      <router-link :to="{ name: 'admin-user' }" class="item" tag="div">
        <div class="link_item">List User</div>
        <i class="ri-account-box-line"></i>
      </router-link>
      <router-link :to="{ name: 'admin-division' }" class="item" tag="div">
        <div class="link_item">List Jabatan</div>
        <i class="ri-user-settings-line"></i>
      </router-link>
      <router-link :to="{ name: 'livestream' }" class="item is_active" tag="div">
        <div class="link_item"> Live Stream </div>
        <i class="ri-youtube-line"></i>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'sidemenu',
  data () {
    return {
      activeEvent: null,
      userInfo: JSON.parse(localStorage.getItem('user-info'))
    }
  },
  mounted () {
    this.$_sys.get('event/active').then(res => {
      this.activeEvent = res.data
    })
  },
  methods: {
    getActiveEvent () {
      this.$_sys.get('event/active').then(res => {
        let data = res.data
        if (data) this.$router.push({ name: 'admin-event-detail', params: { id: data.id }, query: { view: 'statistic' } })
        else this.$_sys.error(null, null, 'Tidak ada event aktif saat ini', true)
      }).catch((err) => {
        this.$_sys.error(err, 'Tidak ada event aktif saat ini', null, true)
      })
    }
  }
}
</script>

<style scoped>
  .side-options,
  .side-options .item {
    border-radius: 8px;
  }
  .side-options .item.is_active i {
    color: #fff;
  }
</style>