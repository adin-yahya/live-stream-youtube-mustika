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
                <input v-model.trim.lazy="filter.src" type="text" class="form-control no-shadow" placeholder="Cari NIK atau Nama Pengguna" aria-label="Keywords" aria-describedby="searchKeywords">
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="form-group mb-0">
              <select v-model="filter.division_id" class="custom-select no-shadow" id="searchLocation" placeholder="Pilih Jabatan">
                <option :value="null">Semua Jabatan</option>
                <option v-for="(dl,i) in divisionList" :key="i+'-division'" :value="dl.id">{{ dl.division_name }}</option>
              </select>
            </div>
          </div>
          <div class="col-auto">
            <a @click="openForm()" class="btn btn-primary">User Baru</a>
            <a @click="openImport()" class="btn bg-success">Import Excel</a>
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
                <th>NIK</th>
                <th>Nama Pengguna</th>
                <th>Jabatan</th>
                <th class="text-right">
                  <button class="btn btn-sm btn-delete" @click="alertRemoveAllData('user')">Delete All User</button>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(d,i) in dataList" :key="i+'-data'">
                <td>{{ filter.limit * (filter.page - 1) + i + 1  }}</td>
                <td>{{ d.nik }}</td>
                <td>{{ d.name }}</td>
                <td>{{ d.division_name || 'Admin Sistem' }}</td>
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
          <label class="mb-2">NIK <span class="text-danger">*</span></label>
          <input v-model="form.nik" class="form-control" type="text" placeholder="16 Digit NIK Pengguna">
        </div>
        <div class="form-group">
          <label class="mb-2">Nama <span class="text-danger">*</span></label>
          <input v-model="form.name" class="form-control" type="text" placeholder="Nama Panggilan singkat Pengguna">
        </div>
        <div class="form-group">
          <label class="mb-2">Jabatan Pengguna <span class="text-danger">*</span></label>
          <select v-model="form.division_id" class="form-control" placeholder="Pilih Jabatan Pengguna">
            <option v-for="(dl,i) in divisionList" :key="i+'-division'" :value="dl.id">{{ dl.division_name }}</option>
          </select>
        </div>
        <div class="form-group">
          <label class="mb-2">Kata Sandi <span class="text-danger">*</span></label>
          <input v-model="form.password" class="form-control" type="password" :placeholder="openFormID? 'Biarkan kosong untuk tidak mengganti Password' : 'Kata sandi digunakan untuk akses sistem'">
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
    <b-modal id="modal-import" size="lg" centered hide-header hide-footer>
      <div class="block_item m-4">
        <div class="row align-items-center">
          <div class="col">
            <p class="Heading">Import Data Pengguna</p>
            <small class="d-block text-gray-700">1. Download Template file excel <a href="/static/user-template.xlsx" target="_blank">DISINI</a> </small>
            <small class="d-block text-gray-700">2. Isikan sesuai dengan format yang telah disediakan </small>
            <small class="d-block text-gray-700">3. Upload dan tunggu beberapa saat </small>
            <small class="d-block text-gray-700 mt-2">Note: NIK yang terdeteksi sama atau sudah terdaftar akan dilewati </small>
            <input hidden type="file" ref="inputUpload" @change="onFileChange" :accept="'.csv, .xls, .xlsx, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel'">
          </div>
          <div class="col-auto">
            <button v-if="!isUploading" class="btn btn-primary" @click="$refs.inputUpload.click()">Upload Disini</button>
            <!-- <b-progress v-else :value="uploadPercentage" :max="100" show-progress animated></b-progress> -->
            <div v-else class="d-flex align-items-center">
              <strong class="text-primary">Uploading...</strong>
              <b-spinner small variant="primary" class="ms-3"></b-spinner>
            </div>
          </div>
        </div>
      </div>
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
      divisionList: [],
      openFormID: null,
      form: {
        nik: null,
        name: null,
        division_id: null,
        password: null
      },
      errForm: null,
      uploadPercentage: 0,
      isUploading: false
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
    let injectDivision = [
      { division_name: 'Administrator Sistem', id: -1 }
    ]
    this.getSubData('division', 'divisionList', injectDivision)
  },
  methods: {
    onFileChange (e) {
      this.isUploading = true
      let file = e.target.files[0]
      this.$_sys.fileUpload('user/import', file, event => {
        this.uploadPercentage = Object.assign({}, this.uploadPercentage, { [id]: Math.round((100 * event.loaded) / event.total) })
      }).then(res => {
        this.isUploading = false
        this.$_sys.success('Pengguna berhasil di import', null, true)
        this.$refs.inputUpload.value = null
        this.getData(1)
        this.$bvModal.hide('modal-import')
      }).catch(error => {
        this.isUploading = false
        this.$refs.inputUpload.value = null
        this.$_sys.error('Pengguna Gagal di import', null, true)
      })
    },
    getData (page) {
      this.isLoading = true
      let f = this.filter
      f.page = page
      this.$_sys.get('user/list', f).then(res => {
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
          nik: data.nik,
          name: data.name,
          division_id: data.division_id,
          password: null
        }
        this.form = Object.assign({}, this.form, formData)
      } else {
        let formData = {
          nik: null,
          name: null,
          division_id: null,
          password: null
        }
        this.form = Object.assign({}, this.form, formData)
      }
      this.$bvModal.show('modal-form')
    },
    openImport () {
      this.$bvModal.show('modal-import')
    },
    submitForm () {
      if (!this.openFormID) {
        if (this.form.nik && this.form.name && this.form.nik && this.form.division_id && this.form.password) {
          this.$_sys.post('user/create', this.form).then(res => {
            this.$_sys.success('Pengguna berhasil ditambahkan', null, true)
            this.$bvModal.hide('modal-form')
            this.getData(this.filter.page)
          }).catch(error => {
            this.errForm = error.data.data.nik[0]
          })
        } else {
          this.errForm = 'Semua field wajib diisi'
        }
      } else {
        if (this.form.nik && this.form.name && this.form.nik && this.form.division_id) {
          this.form['id'] = this.openFormID
          this.$_sys.post('user/update', this.form).then(res => {
            this.$_sys.success('Pengguna berhasil diupdate', null, true)
            this.$bvModal.hide('modal-form')
            this.getData(this.filter.page)
          })
        } else {
          this.errForm = 'Semua field wajib diisi kecuali Kata sandi'
        }
      }
    },
    removeData (e) {
      this.$swal({
        icon: 'warning',
        title: 'Hapus ' + e.name,
        text: e.name + ' akan dihapus PERMANEN dari sistem, Lanjutkan ?',
        toast: false,
        showConfirmButton: true,
        showCancelButton: true,
        confirmButtonText: 'Ya, Lanjutkan',
        cancelButtonText: 'Batalkan',
      }).then((result) => {
        if (result.isConfirmed) {
          this.$_sys.delete('user', e.id).then(res => {
            this.$_sys.success('Pengguna berhasil dihapus', null, true)
            this.getData(this.filter.page)
          })
        }
      })
    },
    alertRemoveAllData (e) {
      this.$swal({
        title: 'Apakah Anda benar - benar yakin?',
        html: `
        <p class="mb-3">Tindakan ini tidak bisa dibatalkan. Ini akan <b>menghapus secara permanen</b> semua data Pengguna sistem.</p>
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
        this.$_sys.success('Pengguna berhasil dikosongkan', null, true)
        this.getData(1)
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