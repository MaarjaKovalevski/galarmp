const express = require('express');
const pool = require('./database');
const cors = require('cors');
const bcrypt = require('bcrypt');
const cookieParser = require('cookie-parser');
const jwt = require('jsonwebtoken')

const port = process.env.PORT || 3000;

const app = express();

app.use(cors({ origin: 'http://localhost:8080', credentials: true}));


app.use(express.json());
app.use(cookieParser());

const secret = "lksdjakldjafakfj87843783382fs";
const maxAge = 60 * 60;

const generatejwt = (id) => { return jwt.sign({ id }, secret, { expiresIn: maxAge }) }



app.get('/auth/authenticate', async(req, res) => {
    console.log('authentication request has arrived');
    const token = req.cookies.jwt;
    console.log('cookiereq', req.cookies);
    let authed = false;
    try {
        if (token) {
            await jwt.verify(token, secret, (err) => {
                if (err) {
                    console.log(err.message);
                    console.log('token is not verified');
                    res.send({ "authed": authed});
                } else {
                    console.log('token is verified');
                    authed = true;
                    res.send({ "authed": authed});
                }
            })
        } else {
            console.log('token does not exist')
            res.send({ "authed": authed});
        }
    } catch (err) {
        console.error(err.message);
        res.status(400).send(err.message);
    }
});

app.post('/auth/signup', async(req, res) => {
    try {
        console.log("signup request has arrived");
        const { email, password } = req.body;

        const salt = await bcrypt.genSalt();
        const bcryptPass = await bcrypt.hash(password, salt);
        const authUser = await pool.query("INSERT INTO login(email, password) values ($1, $2) RETURNING *", [email, bcryptPass]);
        console.log(authUser.rows[0].id);
        const token = await generatejwt(authUser.rows[0].id);
        res
            .status(201)
            .cookie('jwt', token, { maxAge: 6000000, httpOnly: true })
            .json({ user_id: authUser.rows[0].id })
            .send;
    } catch (err) {
        console.log(err.message);
        res.status(400).send(err.message);
    }
});

app.post('/auth/login', async(req, res) => {
    try {
        console.log("login request has arrived");
        const { email, password } = req.body;
        const user = await pool.query("SELECT * FROM login WHERE email = $1", [email]);
        console.log(email)
        if (user.rows.length === 0) return res.status(401).json({ error: "Autoriseerimata kasutaja" });
        const checkPassword = await bcrypt.compare(password, user.rows[0].password);
        if (!checkPassword) return res.status(401).json({ error: "Vale parool" });

        const token = await generatejwt(user.rows[0].id);
        console.log(token);
        res.status(201)
        res.cookie('jwt', token, { maxAge: 60000000, httpOnly: true })
        res.json({ user_id: user.rows[0].id })
        res.send()
        
        console.log('asi', res._header);
    } catch(error) {
        res.status(401).json({ error: error.message })
    }
});

app.get('/auth/logout', (req, res) => {
    console.log('logout request has arrived');
    res.status(202)
    res.clearCookie('jwt')
    res.json({ "Msg": "Cookie cleared" })
    res.send()
    console.log(res._header);
});

// TABLE 1 services METHODS
// GET -all method
app.get('/api/services', async(req, res) => {
    try {console.log("get services request has arrived");
        const services = await pool.query("SELECT * FROM services ORDER BY id ASC");
        res.json(services.rows);
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/services/', async(req, res) => {
    try {console.log("a service request has arrived");
        const service = req.body;
        console.log(service)
        const newservice = await pool.query("INSERT INTO services(id, title, content) values ($1, $2, $3)    RETURNING*", [service.id, service.title, service.content]);
        res.json(newservice);
    } catch (err) {console.error(err.message);}});


// DELETE method
app.delete('/api/services/:id', async(req, res) => {
    try {const { id } = req.params;
        //DELETE TABLE WHEN ID IS -1
        if (id == '-1') {console.log("delete all services request has arrived");
            const deleteAll = await pool.query("DELETE FROM services");
            res.json(deleteAll);
        } else {console.log("delete a service request has arrived");
        const deleteservice = await pool.query("DELETE FROM services WHERE id = $1", [id]);
        res.json(deleteservice);}
    } catch (err) {console.error(err.message);}});

// TABLE 2 servicesadmin METHODS
// GET -all method
app.get('/api/servicesadmin', async(req, res) => {
    try {console.log("get servicesadmin request has arrived");
        const services = await pool.query("SELECT * FROM servicesadmin ORDER BY id ASC");
        res.json(services.rows);
    } catch (err) {console.error(err.message);}});

// GET -id method
app.get('/api/servicesadmin/:id', async(req, res) => {
    try {console.log("get a serviceadmin with route parameter request has arrived");
        const { id } = req.params;
        const services = await pool.query("SELECT * FROM servicesadmin WHERE id = $1", [id]);
        res.json(services.rows[0]); 
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/servicesadmin/', async(req, res) => {
    try {console.log("a serviceadmin post request has arrived");
        const service = req.body;
        console.log(service)
        const newservice = await pool.query("INSERT INTO servicesadmin(id, title, content) values ($1, $2, $3)    RETURNING*", [service.id, service.title, service.content]);
        res.json(newservice);
    } catch (err) {console.error(err.message);}});

// PUT method
app.put('/api/servicesadmin/:id', async(req, res) => {
    try {const { id } = req.params;
        const service = req.body;
        console.log("update serviceadmin request has arrived");
        const updateservice = await pool.query("UPDATE servicesadmin SET (title, content) = ($2, $3) WHERE id = $1", [id, service.title, service.content]);
        res.json(updateservice);
    } catch (err) {console.error(err.message);}});

// DELETE method
app.delete('/api/servicesadmin/:id', async(req, res) => {
    try {const { id } = req.params;
    if (id == '-1') {console.log("delete all adminservice request has arrived");
            const deleteAll = await pool.query("DELETE FROM servicesadmin");
            res.json(deleteAll);
        } else {
            console.log("delete a adminservice request has arrived");
            const deleteservice = await pool.query("DELETE FROM servicesadmin WHERE id = $1", [id]);
            res.json(deleteservice);
        }
    } catch (err) {console.error(err.message);}});

// TABLE 3 pricingbase METHODS
// GET -all method
app.get('/api/pricingbase', async(req, res) => {
    try {console.log("get pricingbase request has arrived");
        const pricings = await pool.query("SELECT * FROM pricingbase ORDER BY id ASC");
        res.json(pricings.rows);
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/pricingbase/', async(req, res) => {
    try {console.log("a pricingbase request has arrived");
        const pricing = req.body;
        console.log(pricing)
        const newpricing = await pool.query("INSERT INTO pricingbase(id, title, content) values ($1, $2, $3)    RETURNING*", [pricing.id, pricing.title, pricing.content]);
        res.json(newpricing);
    } catch (err) {console.error(err.message);}});


// DELETE method
app.delete('/api/pricingbase/:id', async(req, res) => {
    try {const { id } = req.params;
        //DELETE TABLE WHEN ID IS -1
        if (id == '-1') {console.log("delete all pricingbaseadmin request has arrived");
            const deleteAll = await pool.query("DELETE FROM pricingbase");
            res.json(deleteAll);
        } else {console.log("delete a pricingbaseadmin request has arrived");
            const deletepricing = await pool.query("DELETE FROM pricingbase WHERE id = $1", [id]);
            res.json(deletepricing);
        }
    } catch (err) {console.error(err.message);}});

// TABLE 4 pricingbaseadmin METHODS
// GET -all method
app.get('/api/pricingbaseadmin', async(req, res) => {
    try {console.log("get pricingbaseadmin request has arrived");
        const pricings = await pool.query("SELECT * FROM pricingbaseadmin ORDER BY id ASC");
        res.json(pricings.rows);
    } catch (err) {console.error(err.message);}});

// GET -id method
app.get('/api/pricingbaseadmin/:id', async(req, res) => {
    try {console.log("get a pricingbaseadmin with route parameter request has arrived");
        const { id } = req.params;
        const pricing = await pool.query("SELECT * FROM pricingbaseadmin WHERE id = $1", [id]);
        res.json(pricing.rows[0]); 
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/pricingbaseadmin/', async(req, res) => {
    try {console.log("a pricingbaseadmin post request has arrived");
        const pricing = req.body;
        console.log(pricing)
        const newpricing = await pool.query("INSERT INTO pricingbaseadmin(id, title, content) values ($1, $2, $3)    RETURNING*", [pricing.id, pricing.title, pricing.content]);
        res.json(newpricing);
    } catch (err) {console.error(err.message);}});

// PUT method
app.put('/api/pricingbaseadmin/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const pricing = req.body;
        console.log("update pricingbaseadmin request has arrived");
        const updatepricing = await pool.query("UPDATE pricingbaseadmin SET (title, content) = ($2, $3) WHERE id = $1", [id, pricing.title, pricing.content]);
        res.json(updatepricing);
    } catch (err) {console.error(err.message);}});

// DELETE method
app.delete('/api/pricingbaseadmin/:id', async(req, res) => {
    try {const { id } = req.params;
    if (id == '-1') {console.log("delete all pricingbaseadmin request has arrived");
            const deleteAll = await pool.query("DELETE FROM pricingbaseadmin");
            res.json(deleteAll);
        } else {
            console.log("delete a pricingbaseadmin request has arrived");
            const deletepricing = await pool.query("DELETE FROM pricingbaseadmin WHERE id = $1", [id]);
            res.json(deletepricing);
        }
    } catch (err) {console.error(err.message);}});

// TABLE 5 pricingother METHODS
// GET -all method
app.get('/api/pricingother', async(req, res) => {
    try {console.log("get pricingsother request has arrived");
        const pricings = await pool.query("SELECT * FROM pricingother ORDER BY id ASC");
        res.json(pricings.rows);
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/pricingother/', async(req, res) => {
    try {console.log("a pricingother request has arrived");
        const pricing = req.body;
        console.log(pricing)
        const newpricing = await pool.query("INSERT INTO pricingother(id, title, content) values ($1, $2, $3)    RETURNING*", [pricing.id, pricing.title, pricing.content]);
        res.json(newpricing);
    } catch (err) {console.error(err.message);}});


// DELETE method
app.delete('/api/pricingother/:id', async(req, res) => {
    try {const { id } = req.params;
        if (id == '-1') {console.log("delete all pricingother request has arrived");
                const deleteAll = await pool.query("DELETE FROM pricingother");
                res.json(deleteAll);
        } else {
            console.log("delete a pricingother request has arrived");
            const deletepricing = await pool.query("DELETE FROM pricingother WHERE id = $1", [id]);
            res.json(deletepricing);
        }
    } catch (err) {console.error(err.message);}});

// TABLE 6 pricingotheradmin METHODS
// GET -all method
app.get('/api/pricingotheradmin', async(req, res) => {
    try {console.log("get pricingotheradmin request has arrived");
        const pricings = await pool.query("SELECT * FROM pricingotheradmin ORDER BY id ASC");
        res.json(pricings.rows);
    } catch (err) {console.error(err.message);}});

// GET -id method
app.get('/api/pricingotheradmin/:id', async(req, res) => {
    try {console.log("get a pricingotheradmin with route parameter request has arrived");
        const { id } = req.params;
        const pricing = await pool.query("SELECT * FROM pricingotheradmin WHERE id = $1", [id]);
        res.json(pricing.rows[0]); 
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/pricingotheradmin/', async(req, res) => {
    try {console.log("a pricingotheradmin post request has arrived");
        const pricing = req.body;
        console.log(pricing)
        const newpricing = await pool.query("INSERT INTO pricingotheradmin(id, title, content) values ($1, $2, $3)    RETURNING*", [pricing.id, pricing.title, pricing.content]);
        res.json(newpricing);
    } catch (err) {console.error(err.message);}});

// PUT method
app.put('/api/pricingotheradmin/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const pricing = req.body;
        console.log("update pricingotheradmin request has arrived");
        const updatepricing = await pool.query("UPDATE pricingotheradmin SET (title, content) = ($2, $3) WHERE id = $1", [id, pricing.title, pricing.content]);
        res.json(updatepricing);
    } catch (err) {console.error(err.message);}});

// DELETE method
app.delete('/api/pricingotheradmin/:id', async(req, res) => {
    try {const { id } = req.params;
    if (id == '-1') {console.log("delete all pricingotheradmin request has arrived");
            const deleteAll = await pool.query("DELETE FROM pricingotheradmin");
            res.json(deleteAll);
        } else {
            console.log("delete a pricingotheradmin request has arrived");
            const deletepricing = await pool.query("DELETE FROM pricingotheradmin WHERE id = $1", [id]);
            res.json(deletepricing);
        }
    } catch (err) {console.error(err.message);}});

// TABLE 7 contact METHODS
// GET -all method
app.get('/api/contact', async(req, res) => {
    try {console.log("get contacts request has arrived");
        const contacts = await pool.query("SELECT * FROM contact ORDER BY id ASC");
        res.json(contacts.rows);
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/contact/', async(req, res) => {
    try {console.log("a contact post request has arrived");
        const service = req.body;
        console.log(service)
        const newservice = await pool.query("INSERT INTO contact(id, title, content) values ($1, $2, $3)    RETURNING*", [service.id, service.title, service.content]);
        res.json(newservice);
    } catch (err) {console.error(err.message);}});


// DELETE method
app.delete('/api/contact/:id', async(req, res) => {
    try {const { id } = req.params;
        if (id == '-1') {console.log("delete all contacts request has arrived");
                const deleteAll = await pool.query("DELETE FROM contact");
                res.json(deleteAll);
        } else {
            console.log("delete a contact request has arrived");
            const deletecontact = await pool.query("DELETE FROM contact WHERE id = $1", [id]);
            res.json(deletecontact);}
    } catch (err) {console.error(err.message);}});

// TABLE 8 pcontactadmin METHODS
// GET -all method
app.get('/api/contactadmin', async(req, res) => {
    try {console.log("get contactsadmin request has arrived");
        const contacts = await pool.query("SELECT * FROM contactadmin ORDER BY id ASC");
        res.json(contacts.rows);
    } catch (err) {console.error(err.message);}});

// GET -id method
app.get('/api/contactadmin/:id', async(req, res) => {
    try {console.log("get a contactadmin with route parameter request has arrived");
        const { id } = req.params;
        const contact = await pool.query("SELECT * FROM contactadmin WHERE id = $1", [id]);
        res.json(contact.rows[0]); 
    } catch (err) {console.error(err.message);}});

// POST method
app.post('/api/contactadmin/', async(req, res) => {
    try {console.log("a contactadmin post request has arrived");
        const contact = req.body;
        console.log(contact)
        const newcontact = await pool.query("INSERT INTO contactadmin(id, title, content) values ($1, $2, $3)    RETURNING*", [contact.id, contact.title, contact.content]);
        res.json(newcontact);
    } catch (err) {console.error(err.message);}});

// PUT method
app.put('/api/contactadmin/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const contact = req.body;
        console.log("update contactadmin request has arrived");
        const updatecontact = await pool.query("UPDATE contactadmin SET (title, content) = ($2, $3) WHERE id = $1", [id, contact.title, contact.content]);
        res.json(updatecontact);
    } catch (err) {console.error(err.message);}});

// DELETE method
app.delete('/api/contactadmin/:id', async(req, res) => {
    try {const { id } = req.params;
    if (id == '-1') {console.log("delete all contactadmin request has arrived");
            const deleteAll = await pool.query("DELETE FROM contactadmin");
            res.json(deleteAll);
        } else {
            console.log("delete a admincontact request has arrived");
            const deletecontact = await pool.query("DELETE FROM contactadmin WHERE id = $1", [id]);
            res.json(deletecontact);
        }
    } catch (err) {console.error(err.message);}});

app.listen(port, () => {
    console.log("Server is listening to port " + port)
});
