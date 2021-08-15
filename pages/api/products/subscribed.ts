import { NextApiRequest, NextApiResponse } from 'next'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET, {
    apiVersion: '2020-08-27'
})

export default async (req: NextApiRequest, res: NextApiResponse) => {
    const { customer_email, return_url } = req.query

    const { data: customers } = await stripe.customers.list({
        email: customer_email as string
    })

    if (customers.length < 1) {
        return res.status(301).redirect('/profile/no-products')
    }

    const customer = customers[0]
    const session = await stripe.billingPortal.sessions.create({
        customer: customer.id,
        return_url: return_url as string
    })

    return res.status(301).redirect(session.url);
}