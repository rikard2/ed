<template>
    <div class="container">
        <h1 class="title is-2">Jämför lån - utan kreditupplysning</h1>
        <div class="tile">

            <article class="tile is-child notification">
                <h3 class="title is-4">Hur mycket vill du låna?</h3>
                <h3 class="title has-text-info">200 000 kr</h3>
                <input class="slider is-fullwidth is-large is-danger is-circle" step="1" min="0" max="100" value="50" type="range">
                &nbsp;
                <div class="columns">
                    <div class="column" is-one-quarter>
                        <span style="padding-top: 15px" class="title is-6">
                            Anställningsform
                        </span>
                    </div>
                    <div class="column">
                        <div class="select">
                            <select>
                                <option>Fast anställning</option>
                            </select>
                        </div>
                    </div>
                    <div class="column"></div>
                    <div class="column"></div>
                    <div class="column"></div>
                </div>
                <div class="columns">
                    <div class="column" is-one-quarter>
                        <span style="padding-top: 15px" class="title is-6">
                            Årsinkomst
                        </span>
                    </div>
                    <div class="column">
                        <div class="select">
                            <select>
                                <option>Jag är pank</option>
                            </select>
                        </div>
                    </div>
                    <div class="column"></div>
                    <div class="column"></div>
                    <div class="column"></div>
                </div>
                <div class="columns">
                    <div class="column" is-one-quarter>
                        <span style="padding-top: 15px" class="title is-6">Ålder</span>
                    </div>
                    <div class="column">
                        <div class="select">
                            <select>
                                <option>18-24 år</option>
                            </select>
                        </div>
                    </div>
                    <div class="column"></div>
                    <div class="column"></div>
                    <div class="column"></div>
                </div>

                <button @click="search()" class="button is-info is-medium">Fortsätt</button>

            </article>
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
        search() {
            var input = {
                amount: 50000,
                age: 30,
                employment_type: 'PERMANENT',
                yearly_income: 400000
            };
            Vue.axios
              .post('http://127.0.0.1:5002/single/search_loan', { params: JSON.stringify(input) })
              .then(response => {
                  console.log('response', response);
                  this.$router.push('/loansearch/' + response.data.loansearchid)
              })
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
  height: 34px;
  width: 33px;
  border-radius: 3px;
  background: #209cee;
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
