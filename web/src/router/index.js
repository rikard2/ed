import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Budget from '@/components/user/Budget'
import Transactions from '@/components/user/Transactions'
import User from '@/components/user/User'
import Lesson from '@/components/user/Lesson'
Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'Transactions',
            component: Transactions
        },
        {
            path: '/lesson',
            name: 'Lesson',
            props: true,
            component: Lesson
        },
        {
            path: '/lesson/:id',
            name: 'Lesson',
            props: true,
            component: Lesson
        },
        {
          path: '/budget',
          name: 'Budget',
          component: Budget
        },
        {
          path: '/user',
          name: 'User',
          default: Budget,
          component: User,
          children: [
              {
                  path: 'budget',
                  component: Budget
              },
              {
                  path: 'transactions',
                  component: Transactions
              }
          ]
        }
    ]
})
