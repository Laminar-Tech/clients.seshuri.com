import { API_URL } from "../constants"

export default async function getAccessToken() : Promise<string> {
    const { data: { access_token } } = await fetch(`${API_URL}/auth/login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          email: process.env.DIRECTUS_EMAIL,
          password: process.env.DIRECTUS_PASSWORD
        })
      }).then(res => res.json())
    return access_token
}