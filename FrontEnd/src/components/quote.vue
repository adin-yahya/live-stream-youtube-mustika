<template>
  <div class="row mt-5">
    <div class="col-auto">
      <div class="block_account">
        <div class="d-flex justify-content-between title_top">
          <h5 class=""> Berikan Pesan Kesan Anda </h5>
        </div>
        <div class="account_page modal-sign">
          <div class="modal-inner-body">
            <div class="sign-form">
              <form @submit.prevent="submitQuote">
                <h6 style="font-weight: 300" class="mb-2"> Pesan Anda </h6>
                <div class="input-group mb-30">
                  <textarea v-model.trim.lazy="quoteText" rows="10" cols="40" class="form-control no-shadow" placeholder="Ketikkan pesan anda disini"></textarea>
                </div>
                <button class="btn btn-primary btn-block w-100"> Kirim </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col">
      <div class="block_account">
        <div class="d-flex justify-content-between title_top">
          <h5 class=""> Semua Pesan </h5>
        </div>
        <div class="block_item" v-for="(q,i) in dataList" :key="i+'-quote'">
          <div class="row align-items-center">
            <div class="col">
              <h6 class="mb-1">{{ q.name }}</h6>
              <small class="text-gray-700"> {{ q.quote }} </small>
            </div>
          </div>
        </div>
        <div class="block_item d-flex justify-content-center">
          <b-pagination v-model="filter.page" :total-rows="totalData" :per-page="filter.limit"></b-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'quote-component',
  data () {
    return {
      userInfo: JSON.parse(localStorage.getItem('user-info')),
      quoteText: null,
      dataList: [],
      totalData: 0,
      isLoading: true,
      filter: {
        limit: 3,
        page: 1,
        src: null,
        order: 'id',
        sort: 'DESC',
        event_id: null,
      },
    }
  },
  props: {
    id: { required: true }
  },
  watch: {
    id: {
      immediate: true,
      deep: true,
      handler (t) {
        this.filter.event_id = t
      }
    },
    'filter': {
      immediate: true,
      deep: true,
      handler (t) {
        this.getData(t.page)
      }
    }
  },
  methods: {
    submitQuote () {
      if (this.quoteText) {
        let data = {
          quote: this.quoteText,
          users_id: this.userInfo.ref,
          event_id: this.id,
          status_id: 1,
        }
        this.$_sys.post('quote/create', data).then(res => {
          this.getData(1)
          this.quoteText = null
        })
      }
    },
    getData (page) {
      this.isLoading = true
      let f = this.filter
      f.page = page
      this.$_sys.get('quote/list', f).then(res => {
        this.dataList = res.data.data
        this.totalData = res.data.total
        this.isLoading = false
      })
    },
  }
}
</script>

<style>
</style>