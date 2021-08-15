import { signIn, useSession } from "next-auth/client";

export default function useRedirectIfNotLoggedIn() {
    const [session, isLoading] = useSession()

    if (!session && !isLoading) {
        signIn()
    }
}