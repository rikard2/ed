<template>
    <div>
        <h4 class="title is-4" style="text-align: center">Juli 2019</h4>
        <div class="columns">
            <div class="column is-one-third">
                <div>
                     asd
                </div>
            </div>
            <div class="column">
                <div class="level">
                    <div class="columns is-multiline">
                        <div class="column is-one-third" v-for="(cat, i) in overview.categories">

                            <div style="cursor: pointer" class="columns" @mouseover="hoveredCategory = i" @mouseleave="hoveredCategory = -1">
                                <div class="column is-one-fifth">
                                    <span class="icon is-medium">
                                        <span class="fa-stack">
                                            <i class="fas fa-circle fa-stack-2x" :color="iconColor(i, 0.5)"></i>
                                            <i class="fas fa-home fa-stack-1x" :color="iconColor(i, 1)"></i>
                                        </span>
                                    </span>
                                </div>
                                <div class="column" style="margin-top: -10px">
                                    <div class="is-size-5">{{ cat.name }}</div>
                                    <div class="is-size-6">{{ cat.value }} {{ cat.currency }}</div>
                                </div>
                            </div>
                    </div>
                    </div>
                </div>
                <div class="level">
                    mark: <vue-markdown>this is the default slot</vue-markdown>
                    <table class="table is-fullwidth is-striped">
                        <thead>
                            <th>Name</th>
                            <th colspan="2">Progress</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr v-for="e in exercises">
                                <td>{{ e.name }}</td>
                                <td>99</td>
                                <td></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <th></th>
                            <th>235</th>
                            <th>SEK</th>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import PieChart from '@/components/charts/PieChart'
import Vue from 'vue'
import VueMarkdown from 'vue-markdown'

export default {
  name: 'HelloWorld',
  components: { PieChart, VueMarkdown },
  computed: {
     pieColors() {
         return this.colors.map((x, i) => this.iconColor(i, (this.hoveredCategory === i) ? 1 : 0.5));
     }
  },
  data() {
    return {
      hoveredCategory: 0,
      msg: 'Welcome to Your Vue.js App',
      categories: [1, 2, 3],
      overview: {
          categories: []
      },
      exercises: [],
      colors: [
          [ 255, 99, 132  ],
          [ 54, 162, 235  ],
          [ 255, 206, 86  ],
          [ 75, 192, 192  ],
          [ 153, 102, 255 ],
          [ 255, 159, 64  ],
      ]
  }
},
methods: {
    hoverPiece(n) {
    },
    iconColor: function(n, opactity) {
        return 'rgba(' + this.colors[n][0] + ',' + this.colors[n][1] + ',' + this.colors[n][2] + ', ' + opactity + ')';
    }
},
    mounted() {
        Vue.axios
          .post('http://127.0.0.1:5002/exercises', { })
          .then(response => (this.exercises = response.data))
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
