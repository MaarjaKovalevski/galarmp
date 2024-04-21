<!-- Table showing base prices on the web -->
<template>
    <div class="basetable">
        <table>
            <thead>
                <tr>
                    <div class="servname">
                        <th>Algdokumente kuus (tk)</th>
                    </div>
                    <div>
                        <th>Hind (€)</th>
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
            columnWidth: '250px'
        }
    },
    
    methods: {
        // Gets the prices from the database
        async getTable() {
            try {
                const response = await axios.get( process.env.VUE_APP_URL + '/api/pricingBase/');
                console.log(response.data)
                this.pricings = response.data;
            } catch (error) {
                console.error(error);
            }
        },

        // What happens when the window is resized
        onResize() {
            if (window.innerWidth < 500) {
                this.columnWidth = (window.innerWidth/1.9).toString() + 'px';
            } else {
                this.columnWidth = '250px';

            }
        }
    },
    
    mounted () {
        this.getTable();
        this.onResize()
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

td {text-align: center;}

.basetable {width: 80%;}

/* This column is resized when the width of the window is < 500px */
.servname {
    width: v-bind('columnWidth');
    align-content: center;
}

.servprice {
    position: relative;
    align-items: center;
}
</style>