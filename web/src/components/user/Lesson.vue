<template>
    <div>
        <div class="columns">
            <div class="column is-one-fifth">
                <div>
                    <p class="menu-label">Overview</p>
                    <ul class="menu-list">
                        <li>
                            <router-link :to="{ path: '/lesson/' }" exact-active-class="is-active">Overview</router-link>
                        </li>
                    </ul>
                    <p class="menu-label">Lessons</p>
                    <ul class="menu-list">
                        <li v-for="lesson in lessons">
                            <router-link :to="{ path: '/lesson/' + lesson.lessonid }" exact-active-class="is-active">{{ lesson.name }}</router-link>
                            <ul>
                                <li v-for="child in lesson.children">
                                    <router-link :to="{ path: '/lesson/' + child.lessonid }" exact-active-class="is-active">{{ child.name }}</router-link>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="column">
                <h4 class="title is-4" style="text-align: center">{{ lesson.name }}</h4>
                <article class="message">
                <div class="message-body" v-if="lesson.markdown">
                    <vue-markdown :source="lesson.markdown"></vue-markdown>
                </div>
                </article>
                <div class="level">
                    <div class="columns is-multiline">
                        <div class="column is-one-third" v-for="(cat, i) in lessons">
                            <div style="cursor: pointer" class="columns">
                                <div class="column" style="margin-top: -10px">
                                </div>
                            </div>
                    </div>
                    </div>
                </div>
                <div class="level" v-if="!this.$route.params.id">
                    <table class="table is-fullwidth is-striped">
                        <thead>
                            <th>Name</th>
                            <th colspan="2">Progress</th>
                        </thead>
                        <tbody>
                            <tr v-for="l in lessons">
                                <td>{{ l.name }}</td>
                                <td>99 %</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <th></th>
                            <th>50 %</th>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import Vue from 'vue'
import VueMarkdown from 'vue-markdown'

export default {
    name: 'Lesson',
    components: { VueMarkdown },
    computed: {
     pieColors() {
         return this.colors.map((x, i) => this.iconColor(i, (this.hoveredCategory === i) ? 1 : 0.5));
     }
    },
    data() {
        return {
            lessons: [],
            lesson: {}
        }
    },
    methods: {
    },
    mounted() {
        this.$api('/scalar/lessons')
        .then(response => (this.lessons = response.data));

        if (this.$route.params.id) {
            this.$api('/single/get_lesson', { "_lessonid": this.$route.params.id })
            .then(response => (this.lesson = response.data));
        }
    }
}
</script>
<style scoped>
</style>
