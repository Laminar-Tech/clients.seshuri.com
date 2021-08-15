import { API_URL } from "../constants";
import getAccessToken from "./getAccessToken";

export default async function createUser({ email, name }) {
    const accessToken = await getAccessToken()
    const { data } = await fetch(`${API_URL}/items/users`, {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${accessToken}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email, name
        })
    }).then(r => r.json())

    return data
}