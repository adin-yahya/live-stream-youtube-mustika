<template>
  <div class="account_page modal-sign m-0">
    <div class="row">
      <div class="col-lg-6 overflow-hidden">
        <img class="cover_sign w-100" src="/static/assets/images/login.png" alt="">
      </div>
      <div class=" col-lg-6">
        <div class="modal-inner-body">
          <div class="sign-form">
            <div class="head">
              <h2 class="sign_title">Selamat Datang</h2>
            </div>
            <div class="or_line"></div>
            <div class="d-flex justify-content-center ">
              <p class="or"> Masuk untuk melanjutkan </p>
            </div>
            <form @submit.prevent="handleLogin">
              <label> NIK </label>
              <div class="input-group mb-30">
                <div class="input-group-prepend d-flex">
                  <span class="input-group-text">
                    <ion-icon name="mail-outline" role="img" class="md hydrated" aria-label="mail outline"></ion-icon>
                  </span>
                </div>
                <input type="text" v-model.trim="account.nik" class="form-control no-shadow" placeholder="Masukkan nomor NIK Anda" required="">
              </div>
              <label> Kata Sandi </label>
              <div class="input-group mb-30">
                <div class="input-group-prepend d-flex">
                  <span class="input-group-text">
                    <ion-icon name="lock-closed-outline" role="img" class="md hydrated" aria-label="lock closed outline"></ion-icon>
                  </span>
                </div>
                <input type="password" v-model.trim="account.pass" placeholder="Masukkan kata sandi Anda" class="form-control no-shadow" required="">
              </div>
              <div v-if="errLoggedIn" class="alert alert-outline ps-0 ms-0" role="alert">
                <i class="ri-error-warning-line me-2"></i> <small>NIK / Kata Sandi yang anda masukkan salah</small>
              </div>
              <button class="btn btn-primary btn-block mb-50 w-100"> Masuk &amp; Lanjutkan </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'login-component',
  data () {
    return {
      account: {
        // nik: '0000000000000000',
        // pass: 'admin',
        nik: null,
        pass: null,
      },
      errLoggedIn: false
    }
  },
  methods: {
    handleLogin () {
      if (this.account.nik && this.account.pass) {
        // api login
        let user = {
          nik: this.account.nik,
          password: this.account.pass
        }
        this.errLoggedIn = false
        this.$_sys.post('login', user).then(res => {
          let data = res.data
          let user = {
            ref: data.id,
            name: data.name,
            division_id: data.division_id,
            division_name: data.division_name
          }
          localStorage.setItem('user-info', JSON.stringify(user))
          localStorage.setItem('_token_mustika', 'Bearer ' + data.token)
          this.$emit('successLogedIn', user)
        }).catch((err) => {
          this.errLoggedIn = true
        })
      }
    }
  }
}
</script>

<style scoped>
  .input-group-text {
    border-radius: 0 !important;
  }
  .modal-body {
    padding: 0;
  }
  .modal-inner-body {
    margin: 6em 4em;
  }
  .alert-outline {
    display: flex;
    align-items: center;
    color: #ca2424 !important;
  }
</style>