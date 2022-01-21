import Vue from 'vue'
import Router from 'vue-router'
import MainLayout from '@/layouts/main'
import Notfound from '@/pages/404'

Vue.use(Router)

const funct = {
  isntLoggedIn () {
    return Boolean (localStorage.getItem('_token_mustika') === undefined || localStorage.getItem('_token_mustika') == null);
  },
  isAdmin(){
    let userInfo = JSON.parse(localStorage.getItem('user-info'))
    return Boolean(userInfo.division_id === -1)
  }
}

var router = new Router({
  routes: [
    {
      path: '/',
      name: 'MainLayout',
      component: MainLayout,
      redirect: { name: 'livestream' },
      children: [
        {
          path: '/live-stream',
          name: 'livestream',
          component: () => import('./pages/live-stream.vue')
        },
        {
          path: '/sub-stream/:id',
          name: 'substream',
          props: true,
          component: () => import('./pages/sub-stream.vue')
        }
      ]
    },
    {
      path: '/admin',
      name: 'MainLayout',
      component: MainLayout,
      redirect: { name: 'admin-event' },
      beforeEnter: (to, from, next) => {
        if(funct.isAdmin()) next()
        else next({ name: 'livestream', replace: true })
      },
      children: [
        {
          path: '/event',
          name: 'admin-event',
          component: () => import('./pages/admin-event.vue')
        },
        {
          path: '/event-detail/:id',
          name: 'admin-event-detail',
          component: () => import('./pages/admin-event-detail.vue')
        },
        {
          path: '/event-add',
          name: 'admin-event-add',
          component: () => import('./pages/admin-event-add.vue')
        },
        {
          path: '/user',
          name: 'admin-user',
          component: () => import('./pages/admin-user.vue')
        },
        {
          path: '/division',
          name: 'admin-division',
          component: () => import('./pages/admin-division.vue')
        },
      ]
    },
    {
      path: '/countdown',
      name: 'countdown',
      component: () => import('./pages/countdown.vue')
    },
    {
      path: '/404',
      name: 'not-found',
      component: Notfound
    }
  ]
});

// --------------------------------------------------------------
// Route Auth Redirect if '_token_mustika' not found
// --------------------------------------------------------------
router.beforeEach((to, from, next) => {
  if ((to.name !== 'countdown' && to.name !== 'not-found') && funct.isntLoggedIn() ) {
    next({ name: 'countdown', replace: true })
  } else {
    next()
  }
})

export default router
