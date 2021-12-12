import { useSession } from 'next-auth/react'
import React from 'react'
import Layout from '../../components/Layout'
import useRedirectIfNotLoggedIn from '../../hooks/useRedirectIfNotLoggedIn'

export default function index() {
    useRedirectIfNotLoggedIn()
    const { data: session } = useSession()

    const manageBilling = async () => {
        window.location.href = `/api/products/subscribed?customer_email=${session.user.email}&return_url=${window.location.href}`
    }

    return (
        <Layout>
            <div className={"flex flex-col items-center justify-center py-12"}>
                <h1 className="text-3xl text-center font-bold mb-12">Profile</h1>
                <p>Name: <strong>{session?.user.name}</strong></p>
                <p>Email: <strong>{session?.user.email}</strong></p>
                <button onClick={manageBilling} className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded m-4">View Existing Plans</button>
            </div>
        </Layout>
    )
}
