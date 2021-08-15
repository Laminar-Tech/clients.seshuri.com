
import { API_URL } from "../constants"
import { serialize } from "."
import getAccessToken from "./getAccessToken"

/**
 * Gets all products from API
 * https://docs.directus.io/reference/api/query/
 * Follow the query parameters as an object
 * @params query - Query object
 * @returns Product[]
 */
export default async function getUsers<T extends { [key: string]: any }>(query = {} as T): Promise<{ data: any[], meta: { filter_count: number } }> {
    const accessToken = await getAccessToken();

    const allQueryParams = {
        fields: '*',
        meta: 'filter_count',
        ...query
    }

    const { data, meta } = await fetch(`${API_URL}/items/users?${serialize(allQueryParams)}`, {
        headers: {
            Authorization: `Bearer ${accessToken}`
        }
    }).then(r => r.json())
    return { data, meta }
}