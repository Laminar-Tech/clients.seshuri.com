import React, { useEffect } from 'react'
import Link from 'next/link'
import Layout from '../../components/Layout'
import { useRouter } from 'next/router'

export default function result() {
    const router = useRouter()
    useEffect(() => {
        const timeoutHandler = setTimeout(() => {
            router.push('/')
        }, 5000)

        return () => {
            clearTimeout(timeoutHandler)
        }
    }, [])
    return (
        <Layout title="Payment Cancelled">
            <div className="flex flex-col justify-center items-center p-8">
                <h1 className="text-xl font-bold">Payment Result</h1>
                <p className="text-3xl my-4"><strong>Cancelled</strong></p>
                <p>You will be redirected shortly...</p>
                <pre className="bg-gray-50 p-4 rounded-md my-8">session_id: {router.query.session_id}</pre>
                <Link href="/"><a className="hover:underline font-bold">Return home</a></Link>
            </div>
        </Layout>
    )
}
