<template>
  <div class="block_account mb-2 py-3">
    <div v-if="!isLoading" class="table-responsive mt-3">
      <table class="table table-flush table-clickable mb-0">
        <thead>
          <tr>
            <th>No</th>
            <th nowrap>Nama Pengguna</th>
            <th>Pesan</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(a,i) in dataList" :key="i+'-quote'">
            <td>{{ filter.limit * (filter.page - 1) + i + 1  }}</td>
            <td>{{ a.name }}</td>
            <td>{{ a.quote }}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-else class="text-center">
      <b-spinner variant="primary" style="width: 5rem; height: 5rem;" class="m-5"></b-spinner>
    </div>
    <div class="mb-2 text-right d-flex justify-content-between">
      <div>
        <button class="btn btn-sm btn-delete" @click="alertRemoveAllData('quote')">Kosongkan Kesan Pengguna</button>
      </div>
      <b-pagination v-model="filter.page" :total-rows="totalData" :per-page="filter.limit"></b-pagination>
    </div>
  </div>
</template>

<script>
export default {
  name: 'event-quote',
  data () {
    return {
      filter: {
        limit: 10,
        page: 1,
        src: null,
        order: 'id',
        sort: 'DESC',
        division_id: null,
      },
      isLoading: true,
      dataList: null,
      totalData: 0,
    }
  },
  props: {
    id: { required: false },
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
      f.event_id = this.id
      this.$_sys.get('quote/list', f).then(res => {
        this.dataList = res.data.data
        this.totalData = res.data.total
        this.isLoading = false
      })
    },
    alertRemoveAllData (e) {
      this.$swal({
        title: 'Apakah Anda benar - benar yakin?',
        html: `
        <p class="mb-3">Tindakan ini tidak bisa dibatalkan. Ini akan <b>menghapus secara permanen</b> semua data Kesan Pengguna.</p>
        <span class="text-dark-75">Silahkan ketik <b>"konfirmasi"</b> untuk melanjutkan</span>
        `,
        input: 'text',
        icon: 'warning',
        iconColor: '#d42b21',
        padding: '.75rem',
        width: '38rem',
        focusConfirm: false,
        showCancelButton: false,
        confirmButtonText: 'Saya paham konsekuensinya, Buka dokumen ini',
        customClass: {
          confirmButton: 'btn btn-light-danger',
          actions: 'mt-0 mb-5',
          htmlContainer: 'text-left overflow-hidden'
        },
        didOpen: () => {
          this.$swal.disableButtons()
          this.$swal.getInput().addEventListener('keyup', (e) => {
            if (e.target.value === 'konfirmasi') {
              this.$swal.enableButtons()
            } else {
              this.$swal.disableButtons()
            }
          })
        }
      }).then((result) => {
        if (result.isConfirmed) this.removeAllData(e)
      })
    },
    removeAllData (e) {
      this.$_sys.empty(e).then(res => {
        this.$_sys.success('Kesan Pengguna berhasil dikosongkan', null, true)
        this.getData(1)
      })
    }
  }
}
</script>

<style>
</style>