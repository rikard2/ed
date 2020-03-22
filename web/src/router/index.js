import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Budget from '@/components/user/Budget'
import Transactions from '@/components/user/Transactions'
import User from '@/components/user/User'
import Lesson from '@/components/user/Lesson'
import Loan from '@/components/loan'
import LoanSearch from '@/components/loansearch'
import Company from '@/components/company'
Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'Loan',
            component: Loan
        },
        {
            path: '/loans',
            name: 'Loans',
            component: Loan
        },
        {
            path: '/loansearch/:id',
            name: 'LoanSearch',
            props: true,
            component: LoanSearch
        },
        {
            path: '/company',
            name: 'Company',
            component: Company
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
