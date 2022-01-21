<template>
  <div class="container">
    <div class="hero_wrap">
      <div class="block_account mb-2">
        <div class="row">
          <div class="col-md">
            <!-- Keywords -->
            <div class="form-group mb-md-0">
              <div class="input-group input-group-merge">
                <div class="input-group-prepend d-flex">
                  <span class="input-group-text no-radius-r" id="searchKeywords">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                      <path fill="none" d="M0 0h24v24H0z"></path>
                      <path d="M18.031 16.617l4.283 4.282-1.415 1.415-4.282-4.283A8.96 8.96 0 0 1 11 20c-4.968 0-9-4.032-9-9s4.032-9 9-9 9 4.032 9 9a8.96 8.96 0 0 1-1.969 5.617zm-2.006-.742A6.977 6.977 0 0 0 18 11c0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7a6.977 6.977 0 0 0 4.875-1.975l.15-.15z"></path>
                    </svg> </span>
                </div>
                <input v-model.trim.lazy="filter.src" type="text" class="form-control no-shadow" placeholder="Cari nama Jabatan" aria-label="Keywords" aria-describedby="searchKeywords">
              </div>
            </div>
          </div>
          <!-- <div class="col-md">
            <div class="form-group mb-0">
              <select v-model="filter.division_id" class="custom-select" id="searchLocation" placeholder="Pilih Jabatan">
                <option :value="null">Semua Jabatan</option>
                <option v-for="(dl,i) in divisionList" :key="i+'-division'" :value="dl.id">{{ dl.division_name }}</option>
              </select>
            </div>
          </div> -->
          <div class="col-auto">
            <a @click="openForm()" class="btn btn-primary">Jabatan Baru</a>
          </div>
        </div>
      </div>
      <div class="block_account mb-2 py-3">
        <div v-if="isLoading" class="text-center">
          <b-spinner variant="primary" style="width: 5rem; height: 5rem;" class="m-5"></b-spinner>
        </div>
        <div v-else class="table-responsive mt-3">
          <table class="table table-flush table-clickable mb-0">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Jabatan</th>
                <th>Deskripsi</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(d,i) in dataList" :key="i+'-data'">
                <td>{{ filter.limit * (filter.page - 1) + i + 1  }}</td>
                <td>{{ d.division_name }}</td>
                <td>{{ d.desc }}</td>
                <td class="text-right">
                  <button class="btn btn-sm btn-edit" @click="openForm(d)">Edit</button>
                  <button class="btn btn-sm btn-delete" @click="removeData(d)">Delete</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="block_account mb-2 text-right d-flex justify-content-end">
        <b-pagination v-model="filter.page" :total-rows="totalData" :per-page="filter.limit"></b-pagination>
      </div>
    </div>
    <b-modal id="modal-form" size="lg" centered hide-header hide-footer>
      <form @submit.prevent="submitForm" class="m-5">
        <div class="form-group">
          <label class="mb-2">Jabatan<span class="text-danger">*</span></label>
          <input v-model="form.division_name" class="form-control" type="text" placeholder="Nama Jabatan">
        </div>
        <div class="form-group">
          <label class="mb-2">Deskripsi</label>
          <textarea v-model="form.desc" class="form-control" placeholder="Deskripsikan Jabatan ini" rows="10"></textarea>
        </div>
        <div class="form-group row">
          <div class="col-auto">
            <button class="btn btn-primary">Simpan</button>
          </div>
          <div class="col">
            <div v-if="errForm" class="alert alert-primary mb-0 d-flex align-items-center p-0" role="alert">
              <i class="ri-spam-line ri-2x mx-2"></i> {{ errForm }}
            </div>
          </div>
        </div>
      </form>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: 'user-list',
  data () {
    return {
      isLoading: true,
      dataList: null,
      totalData: 0,
      filter: {
        limit: 10,
        page: 1,
        src: null,
        order: 'id',
        sort: 'DESC',
        division_id: null,
      },
      openFormID: null,
      form: {
        division_name: null,
        desc: null,
      },
      errForm: null
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
  mounted () {
  },
  methods: {
    getData (page) {
      this.isLoading = true
      let f = this.filter
      f.page = page
      this.$_sys.get('division/list', f).then(res => {
        this.dataList = res.data.data
        this.totalData = res.data.total
        this.isLoading = false
      })
    },
    getSubData (e, data, inject = []) {
      this.$_sys.get(e, this.filter).then(res => {
        this[data] = inject.concat(res.data)
      })
    },
    openForm (data = null) {
      this.errForm = null
      if (data) {
        this.openFormID = data.id
        let formData = {
          division_name: data.division_name,
          desc: data.desc,
        }
        this.form = Object.assign({}, this.form, formData)
      } else {
        let formData = {
          division_name: null,
          desc: null,
        }
        this.form = Object.assign({}, this.form, formData)
      }
      this.$bvModal.show('modal-form')
    },
    submitForm () {
      if (!this.openFormID) {
        if (this.form.division_name) {
          this.$_sys.post('division/create', this.form).then(res => {
            this.$_sys.success('Jabatan berhasil ditambahkan', null, true)
            this.$bvModal.hide('modal-form')
            this.getData(this.filter.page)
          })
        } else {
          this.errForm = 'Semua field wajib diisi'
        }
      } else {
        if (this.form.division_name) {
          this.form['id'] = this.openFormID
          this.$_sys.post('division/update', this.form).then(res => {
            this.$_sys.success('Jabatan berhasil diupdate', null, true)
            this.$bvModal.hide('modal-form')
            this.getData(this.filter.page)
          })
        } else {
          this.errForm = 'Semua field wajib diisi'
        }
      }
    },
    removeData (e) {
      this.$swal({
        icon: 'warning',
        title: 'Hapus ' + e.division_name,
        text: e.division_name + ' akan dihapus PERMANEN dari sistem, Lanjutkan ?',
        toast: false,
        showConfirmButton: true,
        showCancelButton: true,
        confirmButtonText: 'Ya, Lanjutkan',
        cancelButtonText: 'Batalkan',
      }).then((result) => {
        if (result.isConfirmed) {
          this.$_sys.delete('division', e.id).then(res => {
            this.$_sys.success('Jabatan berhasil dihapus', null, true)
            this.getData(this.filter.page)
          })
        }
      })
    }
  }
}
</script>

<style scoped>
  table td,
  table th {
    vertical-align: middle;
  }
</style>