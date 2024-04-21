<template>
    <div class="mainView">
        <div class="title">
            <h1>Logi sisse</h1>
        </div>
        <!-- Input fields and button to log in -->
        <div class="inputs">
            <label for="username">Kasutajanimi:</label><br>
            <input type="username" id="username" name="username"><br>
            <label for="password">Parool:</label><br>
            <input type="password" id="password" name="password" v-on:keyup.enter="LogIn()"><br>
            <button v-on:click="LogIn()">Logi sisse</button>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    methods: {
        // Method to log in to admin
        LogIn() {
            var data = {
            email: document.getElementById('username').value,
            password: document.getElementById('password').value
            };
            // Using Fetch - post method - send an HTTP post request to the specified URI with the defined body
            fetch( process.env.VUE_APP_URL + "/auth/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                    credentials: 'include',
                    body: JSON.stringify(data),
            })
            .then((response) => response.json())
            .then((data) => {
                console.log(data);
                location.assign("#/admin");
            })
            .catch((e) => {
                console.log(e);
                console.log("error");
            });
        },
        // Sign up method to create an account (currently used temporarily)
        async signUp() {
            try {
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;
                console.log(username)
                const response = await axios.post(process.env.VUE_APP_URL + '/auth/signup', {
                    email: username,
                    password: password
                })
                console.log(response)
            } catch (error) {
                console.log(error);
            }
        }
    }
}

</script>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 3rem;
  position: relative;
}

h2 {font-size: 1.2rem;}

input {
    width: 40%;
    border-radius: 1.5em;
    height: 2.5em;
    margin-bottom: 1em;
    padding-left: 1em;
}

label {
    float: left;
    margin-left: 30%
}

button {
    border-radius: 1.5em;
    padding: 0.5em;
    margin-top: 1em;
}

button :hover {cursor: pointer;}

.mainView {
  max-width: 75%;
  margin: auto;
}

.title {
  text-align: center;
  padding-top: 12em;
  padding-bottom: 8em;
}

.inputs {
    width: 100%;
    text-align: center;
}
</style>