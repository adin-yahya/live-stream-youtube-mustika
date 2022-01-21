// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import firebaseConfig from './firebase'

import globalServices from './global.js'
import { BootstrapVue } from 'bootstrap-vue'
import VueYouTubeEmbed from 'vue-youtube-embed'
import { firestorePlugin } from 'vuefire'
import VueTimeago from 'vue-timeago'
import VueChatScroll from 'vue-chat-scroll'
import VueSweetalert2 from 'vue-sweetalert2';

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'remixicon/fonts/remixicon.css'
import '../static/assets/css/style.css'
import 'sweetalert2/dist/sweetalert2.min.css';

import firebase from 'firebase/app'
import 'firebase/firestore'

const db = firebase.initializeApp(firebaseConfig).firestore()
const chatCollection = db.collection('live-chat')
const participantCollection = db.collection('participant')

const moment = require('moment')
require('moment/locale/id')

Vue.use(BootstrapVue)
Vue.use(VueYouTubeEmbed)
Vue.use(VueSweetalert2)
Vue.use(firestorePlugin)
Vue.use(require('vue-moment'), {
  moment
})
Vue.use(VueTimeago, {
  name: 'Timeago', // Component name, `Timeago` by default
  locale: 'id', // Default locale
  locales: {
    'id': require('date-fns/locale/id')
  }
})
Vue.use(VueChatScroll)

Vue.config.productionTip = false

Vue.prototype.$_sys = globalServices
Vue.prototype.$_chat = chatCollection
Vue.prototype.$_user = participantCollection
Vue.prototype.moment = moment
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
