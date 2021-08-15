import NextAuth from 'next-auth'
import Providers from 'next-auth/providers'
import { createUser, getUsers } from '../../../utils'
import session from '../checkout/session'

export default NextAuth({
  // Configure one or more authentication providers
  providers: [
    Providers.Google({
      clientId: process.env.GOOGLE_ID,
      clientSecret: process.env.GOOGLE_SECRET
    })
    // ...add more providers here
  ],

  // A database is optional, but required to persist accounts in a database
  database: process.env.DATABASE_URL,
  pages: {
    signIn: "/login"
  },
  callbacks: {
    async signIn(user, account, profile) {
      const name = user.name
      const email = user.email

      const { data: users } = await getUsers({ filter: { email: { _eq: email } } })

      if (users.length == 0) {
        await createUser({ email, name })
      }
      return true
    },
    async session(session, token) {
      const { data: users } = await getUsers({ filter: { email: { _eq: session.user.email } } })
      const user = users[0]
      session.prices = user.prices
      return session
    }
  }
})