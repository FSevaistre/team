import Vue from 'vue'
import Router from 'vue-router'
import Event from './components/Event.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/event',
      name: 'event',
      component: Event
    }
  ]
})
