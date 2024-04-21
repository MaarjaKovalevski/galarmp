<template>
    <div class="othertable">
        <table>
            <thead>
                <tr>
                    <div class="servname">
                        <th>Teenus</th>
                    </div>
                    <div>
                        <th>Hind</th>
                    </div>
                </tr>
            </thead>
            <tbody>
                <!-- For loop to show items one at a time in the table -->
                <tr v-for="pricingInfo in pricings" :key="pricingInfo">
                    <div class="servname">
                        <td>{{ pricingInfo.title }}</td>
                    </div>
                    <div class="servprice">
                        <td>{{ pricingInfo.content }}</td>
                    </div>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data () {
        return {
            pricings: [],
            windowWidth: window.innerWidth,
            columnWidth: '600px'
        }
    },

    methods: {
        // Gets the prices from the database
        async getTable() {
            try {
                const response = await axios.get(process.env.VUE_APP_URL + '/api/pricingother/');
                console.log(response.data)
                this.pricings = response.data;
            } catch (error) {
                console.error(error);
            }
        },

        // What happens when the size of the window is < 1024px
        onResize() {
            if (window.innerWidth < 1024) {
                this.columnWidth = (window.innerWidth/1.9).toString() + 'px';
            } else {
                this.columnWidth = '600px';
            }
        }
    },

    mounted () {
        this.getTable();
        this.onResize();
        this.$nextTick(() => {
            window.addEventListener('resize', this.onResize);
        })
    },

    beforeUnmount() { 
        window.removeEventListener('resize', this.onResize); 
    }
}
</script>
    
<style scoped>
th {font-size: 1.4em;}

tr {
    display: flex;
    border-bottom: 0.5px solid;
    border-color: #ededed;
}

.othertable {
    width: 80%;
    display: grid;
}

/* This column is resized when the width of the window is < 1024px */
.servname {width: v-bind('columnWidth');}

.servprice {
    position: relative;
    float: right;
    width: 6em;
}
</style>