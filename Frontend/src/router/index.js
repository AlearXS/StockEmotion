import { createRouter, createWebHistory } from 'vue-router'
import home from '../views/home.vue'
import analysis from '../views/analysis.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/analysis',
      name: 'analysis',
      component: analysis
    }
  ]
})

export default router
