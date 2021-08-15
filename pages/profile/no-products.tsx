import Link from 'next/link'
import React from 'react'
import Layout from '../../components/Layout'

export default function noproducts() {
    return (
        <Layout>
            <div className="p-12 flex flex-col gap-4 items-center justify-center">
                <p className="text-xl font-bold">You currently do not have any existing plans with us</p>
                <Link href="/profile"><a className="font-semibold">← Back to Profile</a></Link>
            </div>
        </Layout>
    )
}
