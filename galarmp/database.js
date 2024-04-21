// database.js
const dotenv = require('dotenv');
dotenv.config({path: "./.env"});
console.log(process.env.VUE_APP_USERNAME);
const Pool = require('pg').Pool;
const pool = new Pool({
    user: process.env.VUE_APP_USERNAME,
    password: process.env.VUE_APP_PASSWORD,
    database: process.env.VUE_APP_DATABASE,
    host: process.env.VUE_APP_HOST,
    port: process.env.VUE_APP_PORT
})

module.exports = pool;

