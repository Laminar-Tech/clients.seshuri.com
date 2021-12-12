import React, { useState } from 'react'
import { loadStripe, StripeError } from '@stripe/stripe-js'
import useSWR from 'swr'
import Layout from '../../components/Layout'
import { useSession } from 'next-auth/react'
import useRedirectIfNotLoggedIn from '../../hooks/useRedirectIfNotLoggedIn'

const stripePromise = loadStripe(process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY)

export default function checkout() {
    useRedirectIfNotLoggedIn()
    const { data: session } = useSession()

    const [createSessionError, setCreateSessionError] = useState<StripeError | null>(null)
    const handleCheckout = (price_id: string) => async (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        setCreateSessionError(null)
        const { sessionId } = await fetch(`/api/checkout/session?price_id=${price_id}&customer_email=${session.user.email}`, {
            method: 'POST',
            headers: {
                "content-type": "application/json",
                "Authorization": `Bearer ${process.env.STRIPE_SECRET}`
            }
        }).then(res => res.json())

        const stripe = await stripePromise
        const { error } = await stripe.redirectToCheckout({
            sessionId
        })

        if (error) {
            setCreateSessionError(error)
        }
    }
    const { data, error } = useSWR(`/api/products/${JSON.stringify(session?.prices ?? [])}`, (url) => fetch(url).then(res => res.json()))
    return (
        <Layout title="Checkout">
            <div className="flex flex-col justify-center p-4 max-w-xl mx-auto">
                {data ? (<div className="p-8w-full">
                    <h1 className="text-xl font-bold">{data.name}</h1>
                    <p className="text-lg text-gray-600 mb-8">{data.description}</p>
                    {createSessionError && <pre>{createSessionError.message}</pre>}
                    {data.prices.length > 0 ? data.prices.map(price => (
                        <div className="p-4 mb-4 border-b-2 border-gray-100" key={price.id}>
                            <p className="py-4"><span className="text-lg">{price.currency.toUpperCase()}</span> <span className="font-bold text-2xl">{price.unit_amount / 100}</span> / {price.interval}</p>
                            <button role="link" onClick={handleCheckout(price.id)} className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Checkout</button>
                        </div>
                    )) : <p className="font-medium text-lg text-gray-600">No prices found...</p>}
                </div>
                ) : error ? <pre>{error.message}</pre> : <p>Loading</p>}
            </div>
        </Layout>
    )
}
