<template>
    <!-- For loop to show services from the database -->
    <div v-for="serviceInfo in services" :key="serviceInfo">
        <h2>
            {{ serviceInfo.title }}
        </h2><br>
        <p style="white-space: pre-wrap;">
            {{ serviceInfo.content }}
        </p><br><br>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data () {
        return {
            services: []
        }
    },

    methods: {
        // Gets the table from the database
        async getTable() {
            try {
                const response = await axios.get(process.env.VUE_APP_URL + '/api/services/');
                console.log(response.data)
                this.services = response.data;
            } catch (error) {
                console.error(error);
            }
        }
    },

    mounted () {
        this.getTable();
    }
}
</script>