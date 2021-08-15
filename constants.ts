const API_URL = process.env.DIRECTUS_URL
const AVAILABLE_COLLECTIONS = ['users', 'announcements'] as const

export {
    API_URL, AVAILABLE_COLLECTIONS
}


export type Announcement = {
    id: string | number,
    date_created: string,
    date_updated: string | null,
    title: string,
    content: string
}

export type User = {
    id: string | number,
    date_created: string,
    date_updated: string | null,
    email: string,
    company?: string
    name?: string,
    prices: string[]
}