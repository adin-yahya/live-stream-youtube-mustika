<template>
  <div class="site-header has_link_dark">
    <header id="masthead" class="site-header header-3 both-types no-transition">
      <div class="container">
        <div class="header-wrap">
          <div class="header-wrap-inner">
            <div class="left-part">
              <!-- .site-branding -->
              <div class="site-branding">
                <div class="site-title">
                  <!-- <a href="/"> -->
                    <div class="logo align-items-center">
                      <img src="/static/assets/images/logo.png" class="mr-20" alt="ootancy">
                      <div class="d-none d-md-block">
                        <span class="d-block text-uppercase">PT. Mustika Jaya Lestari</span>
                        <small style="font-size:12px">Readiness, Flexible and High Achievement</small>
                      </div>
                    </div>
                  <!-- </a> -->
                </div>
              </div>
            </div>
            <!-- ============================ right part -->
            <div class="right-part right">
              <nav id="site-navigation" class="main-nav with-counters visible">
                <div class="mbl-overlay ">
                  <!-- <div id="mega-menu-wrap" class="main-nav-container" role="navigation">
                    <ul id="primary-menu" class="menu">
                      <li class="mega-menu-item nav-item -0 has-submenu">
                        <a href="../Documentation/documentation.html" class="menu-link main-menu-link item-title" data-aos="fade-right" data-aos-delay="200"><span class="">Documentation</span>
                        </a>
                      </li>
                    </ul>
                  </div> -->
                </div>
              </nav>
              <!-- Fullscreen -->
              <div class="clb-hamburger btn-round btn-round-light" tabindex="1">
                <div class="navbar-menu">
                  <a v-if="userInfo" @click="modalUser()" class="btn btn-sm btn-primary btn-outline d-md-block"> {{ userInfo.name }} </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <b-modal v-if="userInfo" id="modal-user" hide-footer hide-header centered size="md" body-class="p-0">
      <div class="box has-style2 no-shadow">
        <div class="box-icon">
          <ion-icon name="person" role="img" class="md hydrated" aria-label="person"></ion-icon>
        </div>
        <h4 class="box-title mb-2">Hai, {{ userInfo.name }} </h4>
        <p class="box-desc">Anda terdaftar sebagai {{ userInfo.division_name }} </p>
        <a @click="logout()" class="btn btn-primary btn-outline mt-4">Logout</a>
      </div>
    </b-modal>
  </div>
</template>

<script>
export default {
  name: 'navigation',
  data () {
    return {
      userInfo: JSON.parse(localStorage.getItem('user-info'))
    }
  },
  methods: {
    modalUser () {
      this.$bvModal.show('modal-user')
    },
    logout () {
      localStorage.clear()
      this.$bvModal.hide('modal-user')
      this.$router.push({ name: 'countdown' })
    }
  }
}
</script>

<style scoped>
  .logo {
    display: flex;
  }
</style>