<template>
<div id="app" v-cloak>
    <nav id="navbar-clone" class="navbar is-fresh is-active has-shadow" role="navigation" aria-label="main navigation">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item" href="/">Lang</a>
            </div>
            <div id="cloned-navbar-menu" class="navbar-menu is-fixed">
                <div class="navbar-end">
                    <a href="#" class="navbar-item is-secondary" v-if="!$session.get('sessionid')">
                        Funktioner
                    </a>
                </div>
                <a href="#" class="navbar-item is-secondary" @click="isLoginModalActive = true" v-if="!$session.get('sessionid')">
                    Logga in
                </a>
                <a class="navbar-item" v-if="!$session.get('sessionid')">
                    <span class="button signup-button rounded secondary-btn is-primary raised" @click="isRegisterModalActive = true">
                        Kom igång
                    </span>
                </a>
                <a href="#/user/budget" class="navbar-item is-secondary" v-if="$session.get('sessionid')">
                    Mina sidor
                </a>
                <a href="#" class="navbar-item is-secondary" @click="logout()" v-if="$session.get('sessionid')">
                    Logga ut {{ $session.get('email') }}
                </a>
            </div>
        </div>
    </nav>
    <main class="bd-main" style="margin-top: 40px;">
        <div class="bd-main-container container">
            <div>
                <router-view :key="$route.fullPath"/>
            </div>
        </div>
    </main>
    <b-modal :width="640" :active.sync="isLoginModalActive">
        <login></login>
    </b-modal>
    <b-modal :width="640" :active.sync="isRegisterModalActive">
        <register></register>
    </b-modal>
</div>

</template>

<script>
import Login from '@/components/Login'
import Register from '@/components/Register'

export default {
    name: 'App',
    components: { Login, Register },
    data() {
        return {
            isLoginModalActive: false,
            isRegisterModalActive: false
        }
    },
    methods: {
        logout() {
            this.$session.destroy()
            this.$router.push('/')
        }
    }
}

</script>
<style lang="sass">
@import '/assets/main.sass';
</style>
<style>

  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
  }
  .content {
    margin-top: 60px;
  }

</style>
