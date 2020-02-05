<template>
<div>
    <div>
        <form action="">
                <div class="modal-card" style="width: auto">
                    <header class="modal-card-head">
                        <p class="modal-card-title">Registrera dig</p>
                    </header>
                    <section class="modal-card-body">
                        <b-field label="E-postadress">
                            <b-input
                                type="email"
                                v-model="email"
                                placeholder="E-postadress"
                                required>
                            </b-input>
                        </b-field>

                        <b-field label="Lösenord">
                            <b-input
                                type="password"
                                v-model="password"
                                password-reveal
                                placeholder="Lösenord"
                                required>
                            </b-input>
                        </b-field>

                        <b-checkbox>Kom ihåg mig</b-checkbox>
                    </section>
                    <footer class="modal-card-foot">
                        <button class="button" type="button" @click="$parent.close()">Stäng</button>
                        <button class="button is-primary" @click="register()">Skapa konto</button>
                    </footer>
                </div>
            </form>
    </div>
</div>
</template>

<script>
import Vue from 'vue'
export default {
    data () {
        return {
            sessionid: null,
            email: null,
            password: null
        }
    },
    methods: {
        register() {
            console.log('hej', this.email, this.password);

            Vue.axios
              .post('http://ec2-52-212-30-250.eu-west-1.compute.amazonaws.com/api/register_user', { "_email": this.email, "_password": this.password })
              .then((response) => {
                  this.sessionid = response.data[0]['register_user']
                  this.$session.start();
                  this.$session.set('sessionid', this.sessionid);
                  this.$session.set('email', this.email);
                  this.$router.push('/user/budget');
                  this.$parent.close()
              });

            return false;
        }
    }
}
</script>

<style scoped>
</style>
