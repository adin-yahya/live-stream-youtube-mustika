<template>
  <form @submit.prevent="submitForm()">
    <div class="block_account">
      <div class="d-flex justify-content-between title_top">
        <h4 class=""> Informasi Dasar </h4>
      </div>
      <div class="form-group">
        <label class="mb-2">Nama Event <span class="text-danger">*</span></label>
        <input v-model="event.event_name" class="form-control" type="text" placeholder="Nama Event">
      </div>
      <div class="form-group">
        <label class="mb-2">Deskripsi</label>
        <textarea rows="5" class="form-control" v-model="event.desc" placeholder="Tuliskan deskripsi Event"></textarea>
      </div>
      <div class="form-group">
        <label class="mb-2">Tanggal Event <span class="text-danger">*</span></label>
        <input v-model="event.date" class="form-control" type="datetime-local" placeholder="Tanggal Event">
      </div>
    </div>
    <div class="block_account">
      <div class="d-flex justify-content-between title_top">
        <h4 class=""> URL Event </h4>
      </div>
      <div class="form-group">
        <label class="mb-2">URL Youtube Live Stream</label>
        <input v-model="event.livestream_link" class="form-control mb-2" type="text" placeholder="URL Youtube">
        <small class="text-gray-700"> Sesi Substream akan dikunci sebelum melewati waktu mulai </small>
      </div>
      <div class="d-none form-group">
        <label class="mb-2">URL Zoom Meeting</label>
        <input v-model="event.meeting_link" class="form-control" type="text" placeholder="URL Zoom">
      </div>
    </div>
    <div class="block_account">
      <div class="d-flex justify-content-between title_top">
        <h4 class=""> URL Video Substream </h4>
      </div>
      <template v-for="(d,i) in divisionList">
        <div v-if="d.id != 1" class="block_item" :key="i+'-division'">
          <h6 class="mb-2">{{ d.division_name }}</h6>
          <div class="form-group row mb-3">
            <div class="col">
              <label class="mb-2">URL Youtube Video</label>
              <input v-model="tmp_substream['division-'+d.id].link" class="form-control" type="text" placeholder="URL Youtube Video">
            </div>
          </div>
          <div class="form-group row mb-3">
            <label class="mb-2">Daftar Pembicara</label>
            <div v-for="(s,i) in tmp_substream['division-'+d.id].speaker" :key="i+'-'+d.id+'-img-speaker'" class="c-customer-review-meta d-flex justify-content-start align-items-center mb-3">
              <div class="user">
                <img :src="s.photo" class="avatar avatar-md rounded-circle">
              </div>
              <div class="meta pl-20">
                <p class="name">{{ s.name }}</p>
                <small @click="removeSpeaker(d.id,i)" class="text-danger pointer">Hapus Pembicara</small>
              </div>
            </div>
            <div v-if="tmp_substream['division-'+d.id].speaker.length === 0">
              <div class="alert text-danger p-0" role="alert">
                <strong>Kosong!</strong> Belum ada pembicara yang ditambahkan
              </div>
            </div>
            <div class="mt-3">
              <a @click="openModalUpload(d.id)" class="btn btn-sm btn-primary btn-outline">Tambah Pembicara {{ d.division_name }}</a>
            </div>
          </div>
        </div>
      </template>
    </div>
    <div class="block_account">
      <div class="d-flex justify-content-between title_top">
        <h4 class=""> Konfigurasi </h4>
      </div>
      <div class="block_item">
        <div class="row align-items-center">
          <div class="col">
            <p class="Heading">Batas Waktu Mulai Substream</p>
            <small class="text-gray-700"> Sesi Substream akan dikunci sebelum melewati waktu mulai </small>
          </div>
          <div class="col-auto">
            <label class="switch">
              <input type="checkbox" v-model="sesion_limit_time_TF" @change="event.sesion_limit_time = null">
              <span class="slider round"></span>
            </label>
          </div>
        </div>
      </div>
      <div class="block_item">
        <div class="row align-items-center">
          <div class="col">
            <p class="Heading">Waktu Mulai Substream</p>
            <small class="text-gray-700"> Substream akan dibuka pada waktu yang telah ditentukan </small>
          </div>
          <div class="col-auto">
            <input :disabled="!sesion_limit_time_TF" v-model="event.sesion_limit_time" class="form-control" type="time" placeholder="times">
          </div>
        </div>
      </div>
      <div class="block_item">
        <div class="row align-items-center">
          <div class="col">
            <p class="Heading">Waktu tunggu Event</p>
            <small class="text-gray-700"> Jeda Waktu (menit) antara Sesi Live Streaming dengan Waktu mulai Event </small>
          </div>
          <div class="col-auto">
            <input v-model="event.waiting_time" class="form-control" type="number" min="0" placeholder="Menit">
          </div>
        </div>
      </div>
    </div>
    <div class="block_account">
      <div class="d-flex justify-content-end">
        <button class="btn btn-primary">Simpan</button>
      </div>
    </div>
    <b-modal id="modal-upload" size="lg" centered hide-header hide-footer>
      <div class="block_item m-4">
        <div class="form-group">
          <label class="mb-2">Nama Pembicara</label>
          <input v-model="input_speaker.name" class="form-control" type="text" placeholder="Nama Lengkap Pembicara">
          <input hidden type="file" ref="inputUpload" @change="onFileChange" :accept="'image/*'">
        </div>
        <div class="form-group">
          <label class="d-block mb-2">Foto Pembicara</label>
          <img v-if="!input_speaker.photo" src="/static/assets/images/user.svg" width="100px" height="100px" style="object-fit:cover" class="me-3">
          <img v-else :src="input_speaker.photo" width="100px" height="100px" style="object-fit:cover" class="me-3">
          <div v-if="!isUploading" class="d-inline-block">
            <a class="btn btn-primary btn-sm btn-outline" @click="$refs.inputUpload.click()"> {{ input_speaker.photo ? 'Upload Ulang' : 'Upload Disini' }}</a>
            <small class="ms-3">Maksimal ukuran upload foto {{ maxUploadedSize }} MB</small>
          </div>
          <div v-else class="d-inline-flex align-items-center">
            <strong class="text-primary">Uploading...</strong>
            <b-spinner small variant="primary" class="ms-3"></b-spinner>
          </div>
        </div>
        <div class="form-group text-right mb-0">
          <button :disabled="!input_speaker.name || !input_speaker.photo" class="btn btn-primary" @click="addSpeaker()">Simpan</button>
        </div>
      </div>
    </b-modal>
  </form>
</template>

<script>
export default {
  name: 'admin-event-form',
  props: {
    id: { required: false }
  },
  data () {
    return {
      isUploading: false,
      uploadPercentage: 0,
      maxUploadedSize: 2,
      openSpeaker: null,
      input_speaker: {
        name: null,
        photo: null
      },
      event: {
        event_name: null,
        desc: null,
        date: null,
        livestream_link: null,
        meeting_link: null,
        sesion_limit_time: null,
        waiting_time: null,
      },
      divisionList: null,
      sesion_limit_time_TF: true,
      tmp_substream: {},
    }
  },
  mounted () {
    this.init()
  },
  methods: {
    openModalUpload (id) {
      this.$bvModal.show('modal-upload')
      this.openSpeaker = id
    },
    addSpeaker () {
      this.tmp_substream['division-' + this.openSpeaker].speaker.push(this.input_speaker)
      this.$bvModal.hide('modal-upload')
      this.input_speaker = {
        name: null,
        photo: null
      }
    },
    removeSpeaker (id, index) {
      this.tmp_substream['division-' + id].speaker.splice(index, 1)
    },
    onFileChange (e) {
      this.isUploading = true
      let file = e.target.files[0]
      console.log(e.size)
      if ((e.target.files[0].size / 1000000).toFixed(2) > this.maxUploadedSize) {
        this.$_sys.error(null,'Upload Gagal', 'Ukuran Gambar terlalu besar')
        this.isUploading = false
      } else {
        this.$_sys.fileUpload('upload', file, event => {
          console.log(event)
        }).then(res => {
          this.isUploading = false
          this.$_sys.success('Upload Berhasil', null, true)
          this.input_speaker.photo = res.data.data
          this.$refs.inputUpload.value = null
        }).catch(error => {
          this.isUploading = false
          this.$refs.inputUpload.value = null
          this.$_sys.error(null,'Upload Gagal', 'Gunakan file / foto lainnya')
        })
      }
    },
    init () {
      if (this.$route.params.id) {
        this.$_sys.get('event/detail/' + this.$route.params.id).then(res => {
          let data = res.data
          if (data) {
            this.sesion_limit_time_TF = Boolean(data.sesion_limit_time)
            data.date = this.moment(data.date).format("yyyy-MM-DDThh:mm")
            this.event = Object.assign({}, this.event, data)
            this.getDivision(data)
          }
        })
      } else {
        this.getDivision(null)
      }
    },
    getDivision (eventData) {
      this.$_sys.get('division').then(res => {
        this.divisionList = res.data
        res.data.forEach(el => {
          let tmp
          if (eventData) tmp = eventData.substream.filter(x => x.division_id === el.id)[0]
          else tmp = null
          if (tmp) {
            this.$set(this.tmp_substream, 'division-' + el.id, {
              id: tmp.id || null,
              speaker: JSON.parse(tmp.speaker_name) || [],
              link: tmp.link || null,
              division_id: tmp.division_id || el.id,
            })
          } else {
            this.$set(this.tmp_substream, 'division-' + el.id, {
              speaker: [],
              link: null,
              division_id: el.id,
            })
          }
        })
      })
    },
    submitForm () {
      let ss = []
      Object.values(this.tmp_substream).forEach(e => {
        e.speaker_name = JSON.stringify(e.speaker)
        delete e.speaker
        ss.push(e)
      }); this.event.substream = ss
      if (this.id) {
        this.$_sys.post('event/update', this.event).then(res => {
          this.$_sys.success('Event berhasil diperbarui', null, true)
        })
      } else {
        this.$_sys.post('event/create', this.event).then(res => {
          this.$router.push({ name: 'admin-event' })
        })
      }
    }
  }
}
</script>

<style scoped>
  .switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;
  }

  .switch input {
    opacity: 0;
    width: 0;
    height: 0;
  }

  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    -webkit-transition: 0.4s;
    transition: 0.4s;
  }

  .slider:before {
    position: absolute;
    content: '';
    height: 26px;
    width: 26px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    -webkit-transition: 0.4s;
    transition: 0.4s;
  }

  input:checked + .slider {
    background-color: #687ded;
  }

  input:focus + .slider {
    box-shadow: 0 0 1px #687ded;
  }

  input:checked + .slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
  }

  /* Rounded sliders */
  .slider.round {
    border-radius: 34px;
  }

  .slider.round:before {
    border-radius: 50%;
  }
</style>