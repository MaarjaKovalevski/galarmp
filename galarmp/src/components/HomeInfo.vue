<template>
    <div v-for="contactInfo in contact" :key="contactInfo">
        <!-- Info from the database -->
        <p style="white-space: pre-wrap;">
            {{ contactInfo.content }}
        </p>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data () {
        return {
            contact: []
        }
    },

    methods: {
        // Gets the table from the database
        async getTable() {
            try {
                const response = await axios.get(process.env.VUE_APP_URL + '/api/contact/');
                console.log(response.data)
                this.contact = response.data;
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