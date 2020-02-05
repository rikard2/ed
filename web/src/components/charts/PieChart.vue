<template>
    <div>
        <canvas ref="mychart"></canvas>
    </div>
</template>

<script>
import { Chart } from 'chart.js'

export default {
    name: 'PieChart',
    props: ['values', 'colors'],
    watch: {
        values(values) {
            var chart = new Chart(this.$refs.mychart, {
                type: 'doughnut',
                data: {
                    datasets: [{
                        label: '# of Votes',
                        data: values,
                        backgroundColor: this.colors,
                        borderWidth: 2
                    }]
                },
                labels: ['a', 'b'],
                options: {
                    animation: false,
                    tooltips: {
                        enabled: false,
                        title() {
                            return 'TAJTEL';
                        },
                        //enabled: false
                        titleFontSize: 17
                    }
                }
            });
        }
    },
    methods: {
    },
    mounted() {
    }
}
</script>

<style scoped>
</style>
