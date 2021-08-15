import React from 'react'
import Head from 'next/head'
import Navbar from './Navbar'

interface LayoutProps extends React.DetailedHTMLProps<React.HTMLAttributes<HTMLDivElement>, HTMLDivElement> {
    children: React.ReactNode | React.ReactNode[],
    title?: string
}

export default function Layout({ children, title = 'Home', ...props }: LayoutProps) {
    return (
        <div {...props} className={"flex flex-col h-screen overflow-y-hidden"}>
            <Head>
                <title>{title ? `Welcome to Seshuri | ${title}` : `Seshuri`}</title>
                <link rel="icon" href="/laminar_tech.svg" type="image/svg+xml" />
            </Head>
            <Navbar />
            <main className="overflow-y-auto h-full">
                {children}
            </main>
            <footer className="p-4">
                <p className="opacity-75 text-center">Laminar Tech Pte Ltd. All rights reserved.</p>
            </footer>
        </div>
    )
}
