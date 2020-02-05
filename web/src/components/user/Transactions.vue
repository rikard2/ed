<template>
<div>
    <h4 class="title is-4" style="text-align: center">Transaktioner</h4>
    <table class="table is-fullwidth is-striped">
  <thead>
    <tr>
      <th>TransactionID</th>
      <th>Statement text</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="t in transactions">
      <th>{{ t.film_title }}</th>
      <td style="width: 80%;">{{ t.film_release_year }}</td>
      <td>
          <a class="button is-small">
            <span class="icon is-small">
              <i class="fas fa-pencil-alt"></i>
            </span>
          </a>
      </td>
    </tr>
</tbody></table>
</div>
</template>

<script>
import Vue from 'vue'
export default {
  name: 'Transactions',
  data () {
        return {
            transactions: []
        }
    },
    mounted() {
        Vue.axios
          .post('http://localhost:5002/transactions', { })
          .then(response => (this.transactions = response.data))
    }
}
</script>

<style scoped>
</style>
