<template>
    <div>
        <div class="columns">
            <aside class="menu" style="text-align: left;">
                <p class="menu-label">Översikt</p>

                <ul class="menu-list">
                    <li><router-link to="/user/budget">Budget</router-link></li>
                    <li><router-link to="/user/transactions">Kategorisera Transaktioner</router-link></li>
                </ul>
            </aside>
            <div class="column" style="text-align: left;">
                <router-view/>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data () {
        return {}
    }
}
</script>

<style scoped>
</style>
