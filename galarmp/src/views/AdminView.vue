<template>
<div class="mainView">
    <div class="title">
        <h1>Admin</h1>
    </div>
    <div class="field">

        <!-- Buttons to lof out, save changes and revert changes -->
        <div class="logoutbtn">
            <button class="textbtns" type="button" v-on:click="LogOut()">Logi välja</button>
        </div>
        <div class="savebtn">
            <button class="textbtns" type="button" v-on:click="saveConfirm()">Salvesta</button>
        </div>
        <div class="savebtn">
            <button class="textbtns" type="button" v-on:click="revertRealtoAdmin()">Võta muudatused tagasi</button>
        </div>
        
        <!-- Services block -->
        <div class="services">
            <div class="caption">
                <h2>Teenused</h2>
                <div class="buttons">
                    <!-- Button to add a service -->
                    <button id="addservbtn" v-on:click="showAddBox('addservitem'), showAddBox('plusserv'), showAddBox('closeserv')">
                        <svg-icon id="plusserv" type="mdi" :path="plus" style="display: block;"></svg-icon>
                        <svg-icon id="closeserv" type="mdi" :path="close" style="display: none;"></svg-icon>
                    </button>
                    <!-- "Show services" button -->
                    <button v-on:click="showHide('serviceitems', 'addservbtn'), showAddBox('dwnbtnserv'), showAddBox('upbtnserv')">
                        <svg-icon id="dwnbtnserv" type="mdi" :path="trgdwn" style="display: block;"></svg-icon>
                        <svg-icon id="upbtnserv" type="mdi" :path="trgup" style="display: none;"></svg-icon>
                    </button>
                </div>
            </div>

            <!-- Service items, default hidden  -->
            <div id="serviceitems">

                <!-- "Add service" boxes, default hidden -->
                <div id="addservitem" class="content">
                    <!-- Input fields to insert base pricing values into the services table -->
                    <div class="divider">
                        <div class="singleLable">
                            <label for="title">Pealkiri:</label>
                        </div>
                        <input type="title" id="titleservicesadmin" name="title"><br>
                    </div>
                    <label for="content">Kirjeldus:</label><br>
                    <textarea name="content" id="contentservicesadmin" class="message"></textarea>
                    <!-- Button to add the item into the services table -->
                    <div class="buttons">
                        <button class="textbtns" v-on:click="addItem('servicesadmin', services)">Lisa teenus</button>
                    </div>
                </div>

                <!-- For loop to show services -->
                <div v-for="(serviceInfo, index) in services" :key="serviceInfo">
                    <div class="content" >
                        <div :id="'hideservice' + index" style="display: block;">
                            <!-- Item itself, default shown -->
                            <h3>
                                {{ serviceInfo.title }}
                            </h3>
                            <p style="white-space: pre-wrap;">
                                {{ serviceInfo.content }}
                            </p>
                        </div>

                        <!-- Editing a specific service input field, default hidden -->
                        <div :id="'editservice' + index" class="content" style="display: none;">
                            <div class="divider">
                                <div class="singleLable">
                                    <label for="title">Pealkiri:</label>
                                </div>
                                <input type="title" :id="'titleservice'+index" name="title" :value="serviceInfo.title"><br>
                            </div>
                            <label for="content">Kirjeldus:</label><br>
                            <textarea name="content" class="message" :id="'contentservice'+index" :value="serviceInfo.content"></textarea>
                            <!-- Saving button to save edited content, shown when edit button is clicked -->
                            <div class="buttons">
                                <button class="textbtns" v-on:click="editItem(serviceInfo.id, 'service'+index, 'servicesadmin')">Salvesta teenus</button>
                            </div>
                        </div>

                        <!-- Buttons to edit the services table based on each item's index -->
                        <div :id="'buttonsserv'+index" class="buttons" style="display: block;">
                            <div style="display: block;">
                                <button v-on:click="switchEntries(index, index-1, services, 'servicesadmin')">
                                    <svg-icon type="mdi" :path="moveup"></svg-icon>
                                </button>
                                <button v-on:click="switchEntries(index, index+1, services, 'servicesadmin')">
                                    <svg-icon type="mdi" :path="movedown"></svg-icon>
                                </button>
                            </div>
                            <button v-on:click="showHideEdit('service'+index), showAddBox('buttonsserv'+index)">
                                <svg-icon type="mdi" :path="edit"></svg-icon>
                            </button>
                            <button v-on:click="deleteItem(serviceInfo.id, 'servicesadmin')">
                                <svg-icon type="mdi" :path="trash"></svg-icon>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pricing tables -->
        <div class="pricings">
            <div class="divider">
                <div class="caption">
                    <h2>Hinnakiri</h2>
                    <div class="buttons">
                        <button v-on:click="showHide('pricingitems', 'addpbbtn'), showAddBox('addpobtn'), showAddBox('dwnbtnpb'), showAddBox('upbtnpb')">
                            <svg-icon id="dwnbtnpb" type="mdi" :path="trgdwn" style="display: block;"></svg-icon>
                            <svg-icon id="upbtnpb" type="mdi" :path="trgup" style="display: none;"></svg-icon>
                        </button>
                    </div>
                </div>
            </div>

            <!-- This div is shown when the "open" button is clicked -->
            <div id="pricingitems">
                <div class="divider">
                    <h3>Baashinnad</h3>
                    <!-- Button to add a base pricing -->
                    <div class="buttons">
                        <button id="addpbbtn" v-on:click="showAddBox('addpbitem'), showAddBox('pluspb'), showAddBox('closepb')">
                            <svg-icon id="pluspb" type="mdi" :path="plus" style="display: block;"></svg-icon>
                            <svg-icon id="closepb" type="mdi" :path="close" style="display: none;"></svg-icon>
                        </button>
                    </div>
                </div>

                <!-- "Add base pricing" boxes, default hidden -->
                <div id="addpbitem" class="content">
                    <div class="divider">
                        <div class="singleLable">
                            <label for="title">Teenus:</label>
                        </div>
                        <input type="title" id="titlepricingbaseadmin" name="title">
                    </div>
                    <div class="divider">
                        <div class="singleLable">
                            <label for="content">Hind:</label>
                        </div>
                        <input class="price" id="contentpricingbaseadmin">
                    </div>
                    <!-- Button to add the item into the pbtable -->
                    <div class="buttons">
                        <button class="textbtns" v-on:click="addItem('pricingbaseadmin', pricingbase)">Lisa hind</button>
                    </div>
                </div>

                <!-- Base pricing table -->
                <div class="basetable">
                    <table>
                        <!-- Table header -->
                        <thead>
                            <tr>
                                <div class="servname"><th>Algdokumente kuus (tk)</th></div>
                                <div><th>Hind (€)</th></div>
                            </tr>
                        </thead>
                        <!-- Table body -->
                        <tbody>
                            <!-- For loop to show table items -->
                            <tr v-for="(pbInfo, index) in pricingbase" :key="pbInfo">
                                <div class="pbtable">
                                    <!-- Service name -->
                                    <div class="servname">
                                        <td>
                                            <!-- Item itself, default shown -->
                                            <div :id="'hidepbone'+index" :value="pbInfo.content" style="display: block;">{{ pbInfo.title }}</div>
                                            <!-- Input field, default hidden -->
                                            <div :id="'editpbone' + index" class="content" style="display: none;">
                                                <input class="pricename" :id="'titlepb'+index" name="title" :value="pbInfo.title">
                                            </div>
                                        </td>
                                    </div>
                                    <!-- Service price -->
                                    <div class="servprice">
                                        <td>
                                            <!-- Item itself, default shown -->
                                            <div :id="'hidepbtwo'+index" :value="pbInfo.content" style="display: block;">{{ pbInfo.content }}</div>
                                            <!-- Input field, default hidden -->
                                            <div :id="'editpbtwo' +index" class="content" style="display: none;">
                                                <input class="price" :id="'contentpb'+index" :value="pbInfo.content">
                                            </div>
                                        </td>
                                    </div>
                                </div>

                                <td style="min-width: 200px;">
                                    <div :id="'editpbbutton' + index" class="content" style="display: none;">
                                        <!-- Saving button to save edited content, shown when edit button is clicked -->
                                        <div class="buttons">
                                            <button class="textbtns" v-on:click="editItem(pbInfo.id, 'pb'+index, 'pricingbaseadmin')">Salvesta hind</button>
                                        </div>
                                    </div>

                                    <!-- Buttons to edit the table based on each item's index -->
                                    <div :id="'buttonspb'+index" class="buttons" style=" display: block;">
                                        <button v-on:click="switchEntries(index, index-1, pricingbase, 'pricingbaseadmin')">
                                            <svg-icon type="mdi" :path="moveup"></svg-icon>
                                        </button>
                                        <button v-on:click="switchEntries(index, index+1, pricingbase, 'pricingbaseadmin')">
                                            <svg-icon type="mdi" :path="movedown"></svg-icon>
                                        </button>
                                        <button v-on:click="showHideEdit('pbone'+index), showHideEdit('pbtwo'+index), showAddBox('editpbbutton'+index), showAddBox('buttonspb'+index)">
                                            <svg-icon type="mdi" :path="edit"></svg-icon>
                                        </button>
                                        <button v-on:click="deleteItem(pbInfo.id, 'pricingbaseadmin')">
                                            <svg-icon type="mdi" :path="trash"></svg-icon>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="divider">
                    <h3>Teenuste hinnad</h3>
                    <!-- Button to add a service pricing -->
                    <div class="buttons">
                        <button id="addpobtn" v-on:click="showAddBox('addpoitem'), showAddBox('pluspo'), showAddBox('closepo')">
                            <svg-icon id="pluspo" type="mdi" :path="plus" style="display: block;"></svg-icon>
                            <svg-icon id="closepo" type="mdi" :path="close" style="display: none;"></svg-icon>
                        </button>
                    </div>
                </div>

                <!-- "Add service pricing" boxes, default hidden -->
                <div id="addpoitem" class="content">
                    <div class="divider">
                        <div class="singleLable">
                            <label for="title">Teenus:</label>
                        </div>
                        <input type="title" id="titlepricingotheradmin" name="title">
                    </div>
                    <div class="divider">
                        <div class="singleLable">
                            <label for="content">Hind:</label>
                        </div>
                        <input class="price" id="contentpricingotheradmin">
                    </div>
                    <!-- Button to add the item into the potable -->
                    <div class="buttons">
                        <button class="textbtns" v-on:click="addItem('pricingotheradmin', pricingother)">Lisa hind</button>
                    </div>
                </div>

                <!-- Services pricing table -->
                <div class="othertable">
                    <table>
                        <!-- Table header -->
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
                        <!-- Table body -->
                        <tbody>
                            <!-- For loop to show table items -->
                            <tr v-for="(poInfo, index) in pricingother" :key="poInfo">
                                <div class="pbtable">
                                    <div class="servname">
                                        <td>
                                            <!-- Item itself, default shown -->
                                            <div :id="'hidepoone'+index" :value="poInfo.content" style="display: block;">{{ poInfo.title }}</div>
                                            <!-- Input field, default hidden -->
                                            <div :id="'editpoone' + index" class="content" style="display: none;">
                                                <input class="pricename" :id="'titlepo'+index" name="title" :value="poInfo.title">
                                            </div>
                                        </td>
                                    </div>
                                    <div class="servprice">
                                        <td>
                                            <!-- Item itself, default shown -->
                                            <div :id="'hidepotwo'+index" :value="poInfo.content" style="display: block; white-space: pre-wrap;">{{ poInfo.content }}</div>
                                            <!-- Input field, default hidden -->
                                            <div :id="'editpotwo' +index" class="content" style="display: none;">
                                                <input class="price" :id="'contentpo'+index" :value="poInfo.content">
                                            </div>
                                        </td>
                                    </div>
                                </div>

                                <td style="min-width: 200px;">
                                    <div :id="'editpobutton' + index" class="content" style="display: none;">
                                        <!-- Saving button to save edited content, shown when edit button is clicked -->
                                        <div class="buttons">
                                            <button class="textbtns" v-on:click="editItem(poInfo.id, 'po'+index, 'pricingotheradmin')">Salvesta hind</button>
                                        </div>
                                    </div>

                                    <!-- Buttons to edit the table based on each item's index -->
                                    <div :id="'buttonspo'+index" class="buttons" style="display: block;">
                                        <button v-on:click="switchEntries(index, index-1, pricingother, 'pricingotheradmin')">
                                            <svg-icon type="mdi" :path="moveup"></svg-icon>
                                        </button>
                                        <button v-on:click="switchEntries(index, index+1, pricingother, 'pricingotheradmin')">
                                            <svg-icon type="mdi" :path="movedown"></svg-icon>
                                        </button>
                                        <button v-on:click="showHideEdit('poone'+index), showHideEdit('potwo'+index), showAddBox('editpobutton'+index), showAddBox('buttonspo'+index)">
                                            <svg-icon type="mdi" :path="edit"></svg-icon>
                                        </button>
                                        <button v-on:click="deleteItem(poInfo.id, 'pricingotheradmin')">
                                            <svg-icon type="mdi" :path="trash"></svg-icon>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Info -->
        <div class="info">
            <div class="divider">
                <div class="caption">
                    <h2>Informatsioon</h2>
                    <!-- Button to show info -->
                    <div class="buttons">
                        <button v-on:click="showAddBox('contactitems'), showAddBox('dwnbtninfo'), showAddBox('upbtninfo')">
                            <svg-icon id="dwnbtninfo" type="mdi" :path="trgdwn" style="display: block;"></svg-icon>
                            <svg-icon id="upbtninfo" type="mdi" :path="trgup" style="display: none;"></svg-icon>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Contact items, default hidden  -->
            <div id="contactitems">
                <div v-for="(contactInfo, index) in contact" :key="contactInfo">
                    <div class="content" >
                        <div class="text">
                            <h3>Tutvustus</h3>
                            <div :id="'hidecontact' + index" style="display: block;">
                                <p style="white-space: pre-wrap;">
                                    {{ contactInfo.content }}
                                </p>
                            </div>

                            <!-- Editing the information input field, default hidden -->
                            <div :id="'editcontact' + index" class="content" style="display: none;">
                                <textarea name="content" class="message" :id="'contentcontact'+index" :value="contactInfo.content"></textarea>
                                <!-- Saving button to save edited content, shown when edit button is clicked -->
                                <div class="buttons">
                                    <button class="textbtns" v-on:click="editInfo(contactInfo.id, 'contact'+index)">Salvesta tutvustus</button>
                                </div>
                            </div>
                        </div>

                        <!-- Button to edit the information shown on the website -->
                        <div class="buttons">
                            <button v-on:click="showHideEdit('contact'+index), showAddBox('editinfo')">
                                <svg-icon id="editinfo" type="mdi" :path="edit" style="display: block;"></svg-icon>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiTriangleDown, mdiTriangle, mdiPlus, mdiClose, mdiTriangleSmallUp, mdiTriangleSmallDown, mdiPencilOutline, mdiTrashCanOutline } from '@mdi/js';
import axios from 'axios';
export default {
    components: {
		SvgIcon
	},

    data () {
        return {
            trgdwn: mdiTriangleDown,
            trgup: mdiTriangle,
            plus: mdiPlus,
            close: mdiClose,
            moveup: mdiTriangleSmallUp,
            movedown: mdiTriangleSmallDown,
            edit: mdiPencilOutline,
            trash: mdiTrashCanOutline,
            services: [],
            pricingbase: [],
            pricingother: [],
            contact: []
        }
    },

    methods: {
        // Logging out of the admin page (deletes jsonwebtoken)
        LogOut() {
            if (confirm("Kas oled kindel, et tahad välja logida?")) {
                if (confirm("Kas tahad muudatused salvestada ja veebilehel nähtavaks teha?")) {
                    this.moveAdminToReal();
                }
                else {
                    this.revertRealtoAdmin();
                }
                fetch(process.env.VUE_APP_URL +"/auth/logout", {
                    credentials: 'include',
                })
                .then((response) => response.json())
                .then((data) => {
                    console.log(data);
                    console.log('jwt removed');
                    this.$router.push("/login");
                })
                .catch((e) => {
                    console.log(e);
                    console.log("error logout");
                });
            }
        },

        //Method to switch to element in database
        async switchEntries(first, second, array, table) {
            if (second <= -1 || second >= array.length) {
                console.log('out of bounds')
            } else {
                const firsthold = array[first]
                const secondhold = array[second]
                console.log('switch', firsthold, secondhold)
                const response1 = await axios.put(process.env.VUE_APP_URL + '/api/' + table + '/' + firsthold.id, {
                    title: secondhold.title,
                    content: secondhold.content
                })
                const response2 = await axios.put(process.env.VUE_APP_URL + '/api/' + table + '/' + secondhold.id, {
                    title: firsthold.title,
                    content: firsthold.content
                })

                console.log(response1, response2)

                this.getTable()
            }
        },

        // Updates a line in specified admin table with new data
        async editItem(id, index, admintable) {
            try {
                const title = document.getElementById("title"+index).value;
                const content = document.getElementById("content"+index).value;
                console.log(title, content)
                const response = await axios.put(process.env.VUE_APP_URL + '/api/' + admintable + '/' + id, {
                    title: title,
                    content: content
                })
                console.log(response.data)
                this.getTable()
            } catch (error) {
                console.log(error);
            }
        },

        // Updates a line in contact admin table with new data
        async editInfo(id, index) {
            try {
                const content = document.getElementById("content"+index).value;
                console.log(content)
                const response = await axios.put(process.env.VUE_APP_URL + '/api/contactadmin/' + id, {
                    title: 'Tutvustus',
                    content: content
                })
                console.log(response.data)
                this.getTable()
            } catch (error) {
                console.log(error);
            }
        },

        // Deletes a line from the specified admin table with specified id
        async deleteItem(id, admintable) {
            if (confirm('Kas oled kindel, et soovid teenuse kustutada?')) {
                try {
                    console.log(id)
                    const response = await axios.delete(process.env.VUE_APP_URL + '/api/' + admintable + '/' + id )
                    console.log(response.data)
                    this.getTable()
                } catch (error) {
                    console.log(error);
                }
            }
        },

        // Adds a new line into the specified admin table
        async addItem(admintable, array) {
            try {
                const title = document.getElementById("title" + admintable).value;
                const content = document.getElementById("content" + admintable).value;
                console.log(title, content)
                const response = await axios.post(process.env.VUE_APP_URL + '/api/' + admintable, {
                    id: array.length,
                    title: title,
                    content: content
                })
                console.log(response.data)
                this.getTable()
                
                document.getElementById("title" + admintable).value = "";
                document.getElementById("content" + admintable).value = "";
            } catch (error) {
                console.log(error);
            }
        },

        // Requests data from the specified admin table and adds recieved data into services array
        async getTable() {
            try {
                const responseserv = await axios.get(process.env.VUE_APP_URL + '/api/servicesadmin/');
                const responsepb = await axios.get(process.env.VUE_APP_URL + '/api/pricingbaseadmin/');
                const responsepo = await axios.get(process.env.VUE_APP_URL + '/api/pricingotheradmin/');
                const responsecon = await axios.get(process.env.VUE_APP_URL + '/api/contactadmin/');
                console.log(responseserv.data, responsepb.data, responsepo.data, responsecon.data)
                this.services = responseserv.data;
                this.pricingbase = responsepb.data;
                this.pricingother = responsepo.data;
                this.contact = responsecon.data;
            } catch (error) {
                console.error(error);
            }
        },

        // Shows or hides services that exist in the database
        showHide(items, addbtn) {
            var element = document.getElementById(items);
            if (element.style.display === "block") {
                element.style.display = "none";
                document.getElementById(addbtn).style.display = "none";
            } else {
                element.style.display = "block";
                document.getElementById(addbtn).style.display = "block";
            }
        },

        // Shows or hides text boxes through which new services can be added
        showAddBox(boxes) {
            var element = document.getElementById(boxes);
            if (element.style.display === "block") {
                element.style.display = "none";
            } else {
                element.style.display = "block";
            }
        },

        // Enables a certain service title or content to be edited
        showHideEdit(tableid) {
            var element1 = document.getElementById("edit"+tableid);
            var element2 = document.getElementById("hide"+tableid);
            if (element1.style.display === "block") {
                element1.style.display = "none";
                element2.style.display = "block";
            } else {
                element1.style.display = "block";
                element2.style.display = "none";
            }
        },

        // Sets admin tables equal to real tables
        async revertRealtoAdmin(){
            try {
                const responseserv = await axios.get(process.env.VUE_APP_URL + '/api/services/');
                const responsepb = await axios.get(process.env.VUE_APP_URL + '/api/pricingbase/');
                const responsepo = await axios.get(process.env.VUE_APP_URL + '/api/pricingother/');
                const responsecon = await axios.get(process.env.VUE_APP_URL + '/api/contact/');
                console.log(responseserv.data, responsepb.data, responsepo.data, responsecon.data)
                this.services = responseserv.data;
                this.pricingbase = responsepb.data;
                this.pricingother = responsepo.data;
                this.contact = responsecon.data;
                const servicesdel = await axios.delete(process.env.VUE_APP_URL + '/api/servicesadmin/-1')
                const pricingbasedel = await axios.delete(process.env.VUE_APP_URL + '/api/pricingbaseadmin/-1')
                const pricingotherdel = await axios.delete(process.env.VUE_APP_URL + '/api/pricingotheradmin/-1')
                const contactdel = await axios.delete(process.env.VUE_APP_URL + '/api/contactadmin/-1')
                console.log(servicesdel.data, pricingbasedel.data, pricingotherdel.data, contactdel.data)

                // Adds the contents of tables into the admintables
                for (let i = 0; i < this.services.length; i++) {
                    const element = this.services[i];
                    const id = i;
                    const title = element.title;
                    const content = element.content;
                    const response2 = await axios.post(process.env.VUE_APP_URL + '/api/servicesadmin/', {
                        id: id,
                        title: title,
                        content: content
                    })
                    console.log(response2.data)
                }
                for (let i = 0; i < this.pricingbase.length; i++) {
                    const element = this.pricingbase[i];
                    const id = i;
                    const title = element.title;
                    const content = element.content;
                    const response2 = await axios.post(process.env.VUE_APP_URL + '/api/pricingbaseadmin/', {
                        id: id,
                        title: title,
                        content: content
                    })
                    console.log(response2.data)
                }
                for (let i = 0; i < this.pricingother.length; i++) {
                    const element = this.pricingother[i];
                    const id = i;
                    const title = element.title;
                    const content = element.content;
                    const response2 = await axios.post(process.env.VUE_APP_URL + '/api/pricingotheradmin/', {
                        id: id,
                        title: title,
                        content: content
                    })
                    console.log(response2.data)
                }
                for (let i = 0; i < this.contact.length; i++) {
                    const element = this.contact[i];
                    const id = i;
                    const title = element.title;
                    const content = element.content;
                    const response2 = await axios.post(process.env.VUE_APP_URL + '/api/contactadmin/', {
                        id: id,
                        title: title,
                        content: content
                    })
                    console.log(response2.data)
                }
                this.getTable();
            } catch (error) {
                console.error(error);
            }
        },

        saveConfirm() {
            if (confirm('Kas oled kindel, et soovid klientidele nähtavat tabelit muuta?')) {
                this.moveAdminToReal();
            }
        },

        // Sets tables shown in web equal to admin tables
        async moveAdminToReal(){
            // Deletes everything previously saved in the tables
            const services = await axios.delete(process.env.VUE_APP_URL + '/api/services/-1')
            const pricingbase = await axios.delete(process.env.VUE_APP_URL + '/api/pricingbase/-1')
            const pricingother = await axios.delete(process.env.VUE_APP_URL + '/api/pricingother/-1')
            const contact = await axios.delete(process.env.VUE_APP_URL + '/api/contact/-1')
            console.log(services.data, pricingbase.data, pricingother.data, contact.data)
            // Adds the contents of servicesAdmin table into the services table
            for (let i = 0; i < this.services.length; i++) {
                const element = this.services[i];
                const id = i;
                const title = element.title;
                const content = element.content;
                const response2 = await axios.post(process.env.VUE_APP_URL + '/api/services/', {
                    id: id,
                    title: title,
                    content: content
                })
                console.log(response2.data)
            }
            for (let i = 0; i < this.pricingbase.length; i++) {
                const element = this.pricingbase[i];
                const id = i;
                const title = element.title;
                const content = element.content;
                const response2 = await axios.post(process.env.VUE_APP_URL + '/api/pricingbase/', {
                    id: id,
                    title: title,
                    content: content
                })
                console.log(response2.data)
            }
            for (let i = 0; i < this.pricingother.length; i++) {
                const element = this.pricingother[i];
                const id = i;
                const title = element.title;
                const content = element.content;
                const response2 = await axios.post(process.env.VUE_APP_URL + '/api/pricingother/', {
                    id: id,
                    title: title,
                    content: content
                })
                console.log(response2.data)
            }
            for (let i = 0; i < this.contact.length; i++) {
                const element = this.contact[i];
                const id = i;
                const title = element.title;
                const content = element.content;
                const response2 = await axios.post(process.env.VUE_APP_URL + '/api/contact/', {
                    id: id,
                    title: title,
                    content: content
                })
                console.log(response2.data)
            }
        }
    },

    mounted () {
        this.getTable();
    }
}


</script>

<style scoped>
h1 {
    font-weight: 500;
    font-size: 4rem;
    position: relative;
    color: #0d1b2a;
}

h2 {
  font-size: 1.8rem;
  color: #0d1b2a;
}

h3 {
    font-size: 1.4rem;
    color: #0d1b2a;
    margin-bottom: 0.5em;
}

p {margin-right: 3em;}

label {
    padding-right: 1em;
    font-size: 1.2em;
}

input {
    border-radius: 1em;
    width: 40em;
    height: 2em;
    padding-left: 1em;
    margin-bottom: 1em;
    margin-top: 0.1em;
}

button {
    margin-left: 1em;
    border: #ededed;
    max-height: 60px;
    background-color: transparent;
}

button :hover {cursor: pointer;}

table {
  border-collapse: collapse;
  width: 100%;
}

th {font-size: 1.4em;}

tr {display: flex;}

textarea {
    white-space: pre-wrap;
}

.mainView {
  max-width: 75%;
  margin: auto;
}

.title {
    text-align: center;
    padding-top: 4em;
    padding-bottom: 3em;
    font-size: 2em;
}

.textbtns {
    border-color: black;
    border: solid 0.5px;
    border-radius: 0.2em;
    padding: 0.7em;
    margin-bottom: 0.5em;
    margin-left: 0em;
}

.logoutbtn {float: right;}

.message {
    border-radius: 0.7em;
    min-width: 53em;
    min-height: 20em;
    max-width: 100%;
    max-height: 50em;
    padding: 1em;
}

.singleLable {min-width: 100px;}

.servname {
    width: 450px;
    align-content: center;
}

.servprice {
    width: 150px;
    position: relative;
    align-items: center;
}

.pricename {
    border-radius: 1em;
    width: 30em;
    height: 2em;
    padding-left: 1em;
    margin-bottom: 1em;
    margin-top: 0.1em;
}

.price {
    border-radius: 1em;
    width: 10em;
    height: 2em;
    padding-left: 1em;
    margin-bottom: 1em;
    margin-top: 0.1em;
}

.divider {display: flex;}

.pbtable {
    display: flex;
    border-bottom: 0.5px solid #000;
    width: 100%;
}

.basetable {
    width: 80%;
    margin-bottom: 3em;
}

.othertable {width: 100%;}

.caption {
    width: 100%;
    background-color: #ededed;
    margin-top: 1em;
    display: flex;
    padding: 0.5em;
}

.content {
    width: 100%;
    margin-top: 1em;
    padding: 0.5em;
    display: flex;
}

.buttons {
    margin-left: auto;
    margin-right: 0;
    display: flex;
}

/* .caption :hover {
    cursor: pointer;
} */

#serviceitems, #pricingitems, #contactitems {
    display: none;
    font-size: small;
    margin-top: 1em;
}

#addservitem, #addservbtn, #editservice, 
#addpbbtn, #addpbitem, 
#addpobtn, #addpoitem {display: none;}

#addpobtn, #addpbbtn {
    display: none;
    background-color: #ededed;
    height: 3em;
}

</style>