import { signIn, useSession } from "next-auth/react";

export default function useRedirectIfNotLoggedIn() {
    const { data: session, status } = useSession()

    const isLoading = status === "loading"
    if (!session && !isLoading) {
        signIn()
    }
}