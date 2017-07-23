import Vue from 'vue'
import App from './App.vue'
import Vuetify from 'vuetify'
import router from './router.js'

Vue.use(Vuetify)

new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})

window.router = router
