import React from 'react'
import { useRouter } from 'next/router'
import useSWR from 'swr'
import Link from 'next/link'
import Layout from '../../components/Layout'

export default function success() {
    const router = useRouter()

    const { data, error } = useSWR(
        router.query.session_id ? `/api/checkout/${router.query.session_id}` : null,
        (url) => fetch(url).then(res => res.json())
    )

    return (
        <Layout title="Payment Succeeded">
            <div className="flex flex-col items-center border-b border-gray-100 p-8">
                <h1 className="text-xl font-bold">Payment Result</h1>
                {error && <p className="my-4 bg-red-500 px-4 py-2 rounded-md text-white font-bold tracking-wide">{error.message}</p>}
                {data && <p className="text-3xl my-4 bg-green-400 px-4 py-2 rounded-md"><strong>{capitalize(data.session.payment_status)}</strong></p>}
                <Link href="/"><a className="hover:underline font-bold">Return home</a></Link>
            </div>
            {!error && <div className="p-4 flex flex-col items-center">
                <h2 className="text-lg font-semibold mb-4">Details</h2>
                <pre className="bg-gray-50 p-4 rounded-md">{data ? JSON.stringify(data, null, 2) : 'Loading...'}</pre>
            </div>}
        </Layout>
    )
}

const capitalize = (s: string) => {
    if (typeof s !== 'string') return ''
    return s.charAt(0).toUpperCase() + s.slice(1)
}
