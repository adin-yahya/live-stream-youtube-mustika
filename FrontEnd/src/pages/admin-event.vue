<template>
  <div class="container">
    <div class="hero_wrap">
      <div class="block_account mb-2">
        <!-- Heading -->
        <div class="d-flex justify-content-between">
          <h4 class="title_top"> Daftar Event </h4>
          <div>
            <router-link :to="{ name:'admin-event-add' }" class="btn btn-primary">Event Baru</router-link>
          </div>
        </div>
        <template v-if="event">
          <div class="block_item" v-for="(s,i) in event" :key="i+'-event'">
            <div class="row mb-2">
              <router-link tag="div" :to="{ name: 'admin-event-detail', params: { id: s.id }, query: { view: 'info' } }" class="col pointer d-flex flex-column">
                <!-- Heading -->
                <h5 class="mb-0 text-primary">{{ s.event_name }}</h5>
                <p class="mb-3 mt-0">{{ s.date | moment("dddd, Do MMMM YYYY, h:mm:ss a") }}</p>
                <!-- Text -->
                <div class="flex-fill">
                  <small class="text-gray-700"> {{ s.desc || 'Belum ada deskripsi acara' }} </small>
                </div>
                <div>
                  <span class="badge border-trasnparent" :class="s.status_id == 4 ? 'btn-primary' : 'btn-secondary'"> {{ s.status_id == 4 ? 'Aktif' : 'Diarsipkan' }} </span>
                </div>
              </router-link>
              <div class="col-auto align-self-start">
                <p class="list-title">Konfigurasi Event</p>
                <hr class="my-0 mb-3">
                <small class="text-gray-700 d-flex text-center"><i :class="s.livestream_link ? imgTrue : imgFalse"></i> <span>Live Stream Link</span></small>
                <!-- <small class="text-gray-700 d-flex text-center"><i :class="s.meeting_link ? imgTrue : imgFalse"></i> Meeting Link</small> -->
                <small class="text-gray-700 d-flex text-center"><i :class="s.sesion_limit_time ? imgTrue : imgFalse"></i> Session limit</small>
                <hr class="my-3">
                <button class="btn btn-edit btn-sm" v-if="s.status_id === 3" @click="setActive(s)">Aktifkan</button>
                <button class="btn btn-secondary btn-sm" v-if="s.status_id === 4" @click="setInActive(s)">Arsipkan</button>
                <button class="btn btn-delete btn-sm" @click="removeEvent(s)">Hapus</button>
              </div>
            </div>
          </div>
        </template>
      </div>
      <div class="block_account mb-2 text-right d-flex justify-content-end">
        <b-pagination v-model="filter.page" :total-rows="totalData" :per-page="filter.limit"></b-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import { getIdFromURL } from 'vue-youtube-embed'
export default {
  name: 'admin-event',
  data () {
    return {
      imgTrue: 'ri-checkbox-circle-line me-2 text-success',
      imgFalse: 'ri-close-circle-line me-2 text-danger',
      event: null,
      totalData: 0,
      filter: {
        limit: 3,
        page: 1
      }
    }
  },
  watch: {
    'filter': {
      immediate: true,
      deep: true,
      handler (t) {
        this.getData(t.page)
      }
    }
  },
  methods: {
    getData (page) {
      this.isLoading = true
      let f = this.filter
      f.page = page
      this.$_sys.get('event/list', f).then(res => {
        this.event = res.data.data
        this.totalData = res.data.total
        this.isLoading = false
      })
    },
    getThumbnail (e) {
      let id = getIdFromURL(e)
      return 'http://img.youtube.com/vi/' + id + '/0.jpg'
    },
    setActive (e) {
      this.$swal({
        icon: 'question',
        title: 'Aktifkan ' + e.event_name,
        text: 'Hanya 1 acara yang dapat diaktifkan, acara yang sedang berlangsung akan digantikan oleh ' + e.event_name + ' Lanjutkan ?',
        toast: false,
        showConfirmButton: true,
        showCancelButton: true,
        confirmButtonText: 'Ya, Lanjutkan',
        cancelButtonText: 'Batalkan',
      }).then((result) => {
        if (result.isConfirmed) {
          this.$_sys.post('event/activated/' + e.id).then(res => {
            this.$_sys.success('Acara berhasil Diaktifkan', null, true)
            this.getData(this.filter.page)
          })
        }
      })
    },
    setInActive (e) {
      this.$swal({
        icon: 'question',
        title: 'Arsipkan ' + e.event_name,
        text: 'Tidak ada Acara yang berlangsung apabila ' + e.event_name + ' di arsipkan, tetap lanjutkan ?',
        toast: false,
        showConfirmButton: true,
        showCancelButton: true,
        confirmButtonText: 'Ya, Lanjutkan',
        cancelButtonText: 'Batalkan',
      }).then((result) => {
        if (result.isConfirmed) {
          this.$_sys.post('event/inactivated/' + e.id).then(res => {
            this.$_sys.success('Acara berhasil Di Arsipkan', null, true)
            this.getData(this.filter.page)
          })
        }
      })
    },
    removeEvent (e) {
      this.$swal({
        icon: 'warning',
        title: 'Hapus Event ' + e.event_name,
        text: 'Event ' + e.event_name + ' akan dihapus PERMANEN dari sistem, Lanjutkan ?',
        toast: false,
        showConfirmButton: true,
        showCancelButton: true,
        confirmButtonText: 'Ya, Lanjutkan',
        cancelButtonText: 'Batalkan',
      }).then((result) => {
        if (result.isConfirmed) {
          this.$_sys.delete('event', e.id).then(res => {
            this.$_sys.success('Event berhasil dihapus', null, true)
            this.getData(this.filter.page)
          })
        }
      })
    }
  }
}
</script>

<style scoped>
  .plan_text {
    padding-bottom: 0 !important;
    overflow: hidden;
  }
  .line-clamp-2 {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  .img-substream {
    width: 100%;
    height: auto;
  }
  .border-trasnparent {
    border-width: 2px;
    border-style: solid;
  }
</style>