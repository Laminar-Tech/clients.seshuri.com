import React from 'react'
import { getProviders, signIn, getSession, getCsrfToken, ClientSafeProvider } from 'next-auth/react'
import Layout from '../components/Layout'
import { formatDate, getCollection } from '../utils'
import { Announcement } from '../constants'

interface SignInProps {
    providers: Record<string, ClientSafeProvider>,
    csrfToken: string,
    announcements: Announcement[]
}

export default function SignIn({ providers, csrfToken, announcements = [] }: SignInProps) {
    return (
        <Layout title="Login">
            <div className="flex flex-wrap gap-8 h-full">
                <div className="flex flex-col flex-grow items-center p-8 overflow-hidden">
                    <div className="flex flex-row items-center gap-8 mb-4">
                        <img src="/laminar_tech.svg" width={64} height={64} alt="logo" />
                        <h1 className="text-3xl font-bold tracking-widest leading-loose">SESHURI</h1>
                    </div>
                    <h1 className="text-2xl font-semibold tracking-widest leading-loose opacity-75">CLIENT PORTAL</h1>
                    <div className="flex flex-wrap items-center gap-4 py-8">
                        {Object.values(providers).map(provider => {
                            if (provider.name === 'Email') {
                                return
                            }

                            return (
                                <button key={provider.id} onClick={() => signIn(provider.id)} className={"bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded inline-flex gap-2 items-center"}>
                                    <img src={`/${provider.name.toLowerCase()}.svg`} width={24} height={24} />
                                    <span>Log in with {provider.name}</span>
                                </button>
                            )
                        })}
                    </div>
                </div>
                <div className="md:border-l md:w-96 border-gray-300 p-8 flex flex-col items-center mx-auto h:auto md:h-full overflow-auto">
                    <h1 className="text-3xl font-bold mb-8 text-center">Announcements</h1>
                    {announcements.length > 0 ? (
                        <ul>
                            {announcements.map(announcement => (
                                <li key={announcement.id} className="mb-4">
                                    <h3 className="font-bold">{announcement.title}</h3>
                                    <div dangerouslySetInnerHTML={{ __html: announcement.content }} />
                                    <small className="opacity-75">{formatDate(announcement.date_created)}</small>
                                </li>
                            ))}
                        </ul>
                    ) : <p className="font-bold opacity-50"><i>No announcements</i></p>}
                </div>
            </div>
        </Layout>
    )
}


export async function getServerSideProps(context) {
    const { req, res } = context
    const session = await (getSession({ req }))

    if (session && res) {
        return {
            redirect: {
                destination: '/',
                permanent: false
            }
        }
    }

    const { data: announcements } = await getCollection('announcements', { sort: '-date_created' })

    return {
        props: {
            session: null,
            providers: await getProviders(),
            csrfToken: await getCsrfToken(context),
            announcements
        }
    }
}