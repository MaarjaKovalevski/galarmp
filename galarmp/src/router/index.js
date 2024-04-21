import { createRouter, createWebHashHistory } from 'vue-router'
import HomePage from '@/views/HomePage.vue'
import ServicesView from '../views/ServicesView.vue'
import PricingView from '../views/PricingView.vue'
import ContactView from '../views/ContactView.vue'
import LogIn from '@/views/LogIn.vue'
import AdminView from '../views/AdminView.vue'
import auth from '../auth.js'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomePage
  },
  {
    path: '/teenused',
    name: 'services',
    component: ServicesView
  },
  {
    path: '/hinnakiri',
    name: 'pricing',
    component: PricingView
  },
  {
    path: '/kontakt',
    name: 'contact',
    component: ContactView
  },
  {
    path: '/login',
    name: 'login',
    component: LogIn
  },
  {
    path: '/admin',
    name: 'admin',
    component: AdminView,
    beforeEnter: async(to, from, next) => {
      let authResult = await auth.authed();
      console.log('tere');
      console.log(authResult);
      if(!authResult) {
        next('/login')
      } else {
        next();
      }
    }
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
