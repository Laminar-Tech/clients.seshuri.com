import { NextApiRequest, NextApiResponse } from 'next'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET, {
    apiVersion: '2020-08-27'
})

export default async (req: NextApiRequest, res: NextApiResponse) => {
    const priceIds = JSON.parse((req.query.priceId ?? '[]') as string) as string[]
    const prices = await stripe.prices.list({ product: process.env.PRODUCT_ID })
    const product = await stripe.products.retrieve(process.env.PRODUCT_ID)

    const result = {
        id: process.env.PRODUCT_ID,
        name: product.name,
        description: product.description,
        prices: prices.data.filter(price => priceIds.includes(price.id)).map(price => ({
            id: price.id,
            currency: price.currency,
            unit_amount: price.unit_amount,
            interval: price.recurring.interval,
            interval_count: price.recurring.interval_count
        }))
    }

    res.status(200).json(result)
}