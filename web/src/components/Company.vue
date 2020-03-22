<template>
    <div class="container">
        <div v-for="c in companies" :key="companyid">
            <img v-if="c.logo" style="max-width: 100px" v-bind:src="renderImg(c)">
            <hr>
        </div>
    </div>
</template>

<script>

import Vue from 'vue'
import VueMarkdown from 'vue-markdown'

export default {
    name: 'Loan',
    components: { },
    computed: {
    },
    data() {
        return {
            companies: []
        }
    },
    methods: {
        renderImg: function(c) {
            return c.logo;
        }
    },
    mounted() {
        Vue.axios
          .post('http://127.0.0.1:5002/companies', { })
          .then(response => (this.companies = response.data))
    }
}
</script>
<style scoped>
input[type=range] {
  -webkit-appearance: none;
  width: 100%;
  margin: 9.15px 0;
}
input[type=range]:focus {
  outline: none;
}
input[type=range]::-webkit-slider-runnable-track {
  width: 100%;
  height: 15.7px;
  cursor: pointer;
  background: #white;
  border-radius: 1.3px;
  border: 0.5px solid #e0e0e0;
}
input[type=range]::-webkit-slider-thumb {
  border: 1px solid #333;
  height: 34px;
  width: 33px;
  border-radius: 3px;
  background: hsl(141, 71%, 48%);
  cursor: pointer;
  -webkit-appearance: none;
  margin-top: -9.35px;
}
input[type=range]:focus::-webkit-slider-runnable-track {
}
input[type=range]::-moz-range-track {
  width: 100%;
  height: 15.7px;
  cursor: pointer;
  border-radius: 1.3px;
}
input[type=range]::-moz-range-thumb {
  border: 1px solid #000000;
  height: 34px;
  width: 33px;
  border-radius: 5px;
  background: #ffffff;
  cursor: pointer;
}
input[type=range]::-ms-track {
  width: 100%;
  height: 15.7px;
  cursor: pointer;
  background: transparent;
  border-color: transparent;
  color: transparent;
}
input[type=range]:focus::-ms-fill-lower {
}
input[type=range]:focus::-ms-fill-upper {
}

</style>
