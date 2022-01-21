<template>
  <div class="container">
    <div class="row align-items-center justify-content-center block_thank_you ">
      <div class="col-12 col-md-7 col-lg-5 text-center">
        <div class="title_404"> Event Selesai </div>
        <div class="d-flex justify-content-center mb-30">
          <img src="/static/assets/images/icons/thanks.svg" alt="">
        </div>
        <!-- Heading -->
        <h1 class="display-3 mb-20"> Event Selesai </h1>
        <!-- Text -->
        <p class="text-muted mb-40"> Terimakasih atas kehadiran anda pada event ini.</p>
        <!-- Button -->
        <div v-if="errMessage" class="alert alert-primary" role="alert">
           {{ errMessage }} 
        </div>
        <a @click="$bvModal.show('login-modals')" class="btn btn-primary btn-lg" role="button">Login Sebagai Administrator</a>
      </div>
    </div>
    <b-modal id="login-modals" hide-footer hide-header centered size="xl" body-class="p-0">
      <login-component @successLogedIn="loginCheck"></login-component>
    </b-modal>
  </div>
</template>

<script>
import LoginComponent from '@/components/login'
export default {
  name: 'notfound',
  components: {
    LoginComponent
  },
  data () {
    return {
      userInfo: JSON.parse(localStorage.getItem('user-info')),
      errMessage: null
    }
  },
  mounted () {
    let userInfo = JSON.parse(localStorage.getItem('user-info'))
    if (userInfo && userInfo.division_id === -1) this.$router.push({ name: 'admin-event' })
  },
  methods: {
    loginCheck (e = null) {
      if (!e) this.$bvModal.show('login-modals')
      else {
        if (e.division_id === -1) this.$router.push({ name: 'admin-event' })
        else {
          this.$bvModal.hide('login-modals')
          this.errMessage = 'Maaf anda bukan administrator'
        }
      }
    }
  }
}
</script>

<style>
</style>