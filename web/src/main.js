// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import Buefy from 'buefy'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueSession from 'vue-session'

import router from './router'

Vue.use(VueAxios, axios)
Vue.use(Buefy)
Vue.use(VueSession)
var Common = {};
Common.install = function(Vue, options) {
    Vue.prototype.$api = function(path, params) {
        return Vue.axios
          .post('http://127.0.0.1:5002' + path, params || {});
    }
}
Vue.use(Common);
Vue.config.productionTip = false
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
