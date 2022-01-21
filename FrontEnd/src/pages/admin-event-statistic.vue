<template>
  <div>
    <div class="block_account mb-2 py-3">
      <h5>Daftar hadir</h5>
      <div class="table-responsive mt-3">
        <b-table id="my-table" :items="participant" :per-page="10" :current-page="page" small :fields="fields">
          <template #cell(live_flag)="data">
            <span v-if="data.value === 1" class="badge badge-primary bg-primary">Mengikuti</span>
            <span v-else class="badge badge-primary bg-danger">Tidak Mengikuti</span>
          </template>
          <template #cell(sub_flag)="data">
            <span v-if="data.value === 1" class="badge badge-primary bg-primary">Mengikuti</span>
            <span v-else class="badge badge-primary bg-danger">Tidak Mengikuti</span>
          </template>
        </b-table>
      </div>
      <div class=" mb-2 text-right d-flex justify-content-end">
        <b-pagination v-model="page" :total-rows="participantTotal" :per-page="10"></b-pagination>
      </div>
    </div>
    <div v-if="absentList.length>0" class="block_account mb-2 py-3">
      <h5>Pengguna yang tidak Hadir</h5>
      <div v-if="!absentIsLoading" class="table-responsive mt-3">
        <table class="table table-flush table-clickable mb-0">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama Pengguna</th>
              <th>Jabatan</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(a,i) in absentList" :key="i+'-participant'">
              <td>{{ absentfilter.limit * (absentfilter.page - 1) + i + 1  }}</td>
              <td>{{ a.name }}</td>
              <td>{{ a.division_name }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-else class="text-center">
        <b-spinner variant="primary" style="width: 5rem; height: 5rem;" class="m-5"></b-spinner>
      </div>
      <div class=" mb-2 text-right d-flex justify-content-end">
        <b-pagination v-model="absentfilter.page" :total-rows="absentTotal" :per-page="absentfilter.limit"></b-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'admin-event-form',
  props: {
    id: { required: false },
  },
  data () {
    return {
      src: null,
      page: 1,
      fields: [
        {
          key: 'username',
          label: 'Nama Pengguna',
          sortable: false,
        },
        {
          key: 'live_flag',
          label: 'LiveStream',
          sortable: false,
        },
        {
          key: 'sub_flag',
          label: 'SubStream',
          sortable: false,
        },
      ],
      participant: [],
      isLoading: true,
      absentfilter: {
        limit: 10,
        page: 1,
        src: null,
        order: 'id',
        sort: 'DESC',
        division_id: null,
      },
      absentList: [],
      absentTotal: 0,
      absentIsLoading: true
    }
  },
  computed: {
    participantTotal(){
      return this.participant.length
    },
    participantID(){
      return this.participant.map(x => x.user_ref)
    }
  },
  watch: {
    id: {
      immediate: true,
      handler (id) {
        this.$bind('participant', this.$_user.where('event_id', '==', Number(id)).orderBy('date'))
      }
    },
    absentfilter: {
      immediate: true,
      deep: true,
      handler (t) {
        this.getHistory(t.page)
      }
    }
  },
  mounted () {
  },
  methods: {
    getHistory (page) {
      this.absentIsLoading = true
      let f = this.absentfilter
      f.page = page
      f.id_not_in = this.participantID
      this.$_sys.get('user/list', f).then(res => {
        this.absentList = res.data.data
        this.absentTotal = res.data.total
        this.absentIsLoading = false
      })
    },
  }
}
</script>

<style scoped>
  .table td {
    padding: 1rem 0.5rem;
  }
</style>