import { NextApiRequest, NextApiResponse } from 'next'
import Stripe from 'stripe'

const stripe = new Stripe(process.env.STRIPE_SECRET, {
	apiVersion: '2020-08-27'
})

export default async (req: NextApiRequest, res: NextApiResponse) => {
	let customer_id;
	const { price_id, customer_email } = req.query
	const { data: customers } = await stripe.customers.list({
		email: customer_email as string
	})

	if (customers.length < 1) {
		customer_id = null
	} else {
		customer_id = customers[0].id
	}

	const sessionConfig: Stripe.Checkout.SessionCreateParams = {
		mode: 'subscription',
		payment_method_types: ['card'],
		line_items: [
			{
				price: price_id as string,
				quantity: 1,
			},
		],
		success_url: `${req.headers.origin}/checkout/success?session_id={CHECKOUT_SESSION_ID}`,
		cancel_url: `${req.headers.origin}/checkout/cancel?session_id={CHECKOUT_SESSION_ID}`,
	}

	if (customer_id) {
		sessionConfig.customer = customer_id
	} else {
		sessionConfig.customer_email = customer_email as string
	}

	try {
		const session = await stripe.checkout.sessions.create(sessionConfig);
		res.status(200).json({ sessionId: session.id })
	} catch (e) {
		res.status(500).json(e)
	}
}