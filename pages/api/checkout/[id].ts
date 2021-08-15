import { NextApiRequest, NextApiResponse } from 'next'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET, {
    apiVersion: '2020-08-27'
})

export default async (req: NextApiRequest, res: NextApiResponse) => {
    const { id } = req.query
    const session = await stripe.checkout.sessions.retrieve(id as string);

    res.status(200).json({ session })
}