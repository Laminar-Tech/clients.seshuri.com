import { getSession } from "next-auth/react"
import Link from "next/link"
import Layout from "../components/Layout"
import { useRouter } from 'next/router'
import { useEffect } from "react";


export default function Home({ session }) {
	const router = useRouter();

	useEffect(() => {
		if (session) {
			router.push('/profile')
		} else {
			router.push('/login')
		}
	}, [session])

	return (
		<Layout title="Client Portal">
			<div className="flex flex-col items-center justify-center gap-8 h-full">
				<h1 className="text-3xl font-bold">Seshuri Client Portal</h1>
				<p><Link href="/login"><a className={"bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded inline-flex items-center"}>Login</a></Link></p>
			</div>
		</Layout>
	)
}

export async function getServerSideProps(context) {
	const { req, res } = context;
	const session = await getSession({ req })

	return {
		props: {
			session
		}
	}
}
