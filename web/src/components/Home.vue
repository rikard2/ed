<template>
<div>
    <section class="hero is-fullheight is-default is-bold">

    <div class="hero-body">
        <div class="container">
            <div class="columns is-vcentered">
                <div class="column is-5 is-offset-1 landing-caption">
                    <h1 class="title is-1 is-bold is-spaced">
                        Ta kontroll över din ekonomi
                    </h1>
                    <h2 class="subtitle is-5 is-muted">
                    När du har koll på pengarna, är livet bra. Vi hjälper dig att ta kontroll över din ekonomi.</h2>
                    <p>
                        <a class="button cta is-large rounded secondary-btn raised is-primary" @click="isRegisterModalActive = true">
                            Kom igång
                        </a>
                    </p>
                </div>
                <div class="column is-5 is-offset-1">
                    <figure class="image is-4by3">
                        <img src="/static/girl.svg" alt="Description">
                    </figure>
                </div>

            </div>
        </div>
    </div>
</section>
<b-modal :width="640" :active.sync="isRegisterModalActive">
    <register></register>
</b-modal>

<section class="section section-feature-grey is-medium">
    <div class="container">
        <div class="columns">
            <div class="column is-10 is-offset-1">
                <div class="has-text-centered">
                    <img class="pushed-image" src="/static/screenshot.png">
                </div>
            </div>
        </div>

        <p class="has-text-centered mt-20">
            <a class="button cta is-large rounded secondary-btn raised is-primary" @click="isRegisterModalActive = true">
                Kom igång
            </a>
        </p>
    </div>
</section>

</div>

</div>
</section>

</template>

<script>
import Login from '@/components/Login'
import Register from '@/components/Register'
export default {
    name: 'Home',
    components: { Login, Register },
    data () {
        return {
            isLoginModalActive: false,
            isRegisterModalActive: false
        }
    }
}
</script>

<style scoped>
</style>
