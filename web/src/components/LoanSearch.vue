<template>
    <div class="container">
        <div v-for="c in loansearch.companies">
            <img v-if="c.logo" style="max-width: 100px" v-bind:src="c.logo">
            <hr>
        </div>
    </div>
</template>

<script>

import Vue from 'vue'
import VueMarkdown from 'vue-markdown'

export default {
    name: 'LoanSearch',
    components: { },
    computed: {
    },
    data() {
        return {
            loansearch: {}
        }
    },
    methods: {
    },
    mounted() {
        Vue.axios
          .post('http://127.0.0.1:5002/single/loansearch', { loansearchid: this.$route.params.id })
          .then(response => (this.loansearch = response.data.loansearch))
    }
}
</script>
<style scoped>
</style>
