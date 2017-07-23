import Vue from 'vue'
import Router from 'vue-router'
import Event from './components/Event.vue'
import Home from './components/Home.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/event',
      name: 'event',
      component: Event
    },
    {
      path: '/',
      name: 'home',
      component: Home
    }
  ],
  linkActiveClass: "",
  linkExactActiveClass: "active"
})
