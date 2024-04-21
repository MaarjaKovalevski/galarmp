export default {
    user: { authed: false },
    authed: async function() {
        await fetch(process.env.VUE_APP_URL + "/auth/authenticate", {
                credentials: 'include', 
            })
            .then((response) => response.json())
            .then((data) => {
                this.user.authed = data.authed;
                console.log(data);
            })
    
        .catch((e) => {
            console.log(e);
        });
        return this.user.authed;
    }
}