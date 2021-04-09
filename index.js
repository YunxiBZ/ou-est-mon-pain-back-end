require('dotenv').config();

const express = require('express');

const app = express();

const cors = require('cors');

const port = process.env.PORT || 5478;

const router = require('./app/router');

app.use(cors());

app.use(cors({
    origin: '*',
    optionsSuccessStatus: 200,
    credentials: true,
    allowedHeaders: ['Content-Type', 'authorization']
}));

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-headers", "Origin, x-Requested-With, Content-Type, Accept, authorization");
    res.header("Access-Control-Allow-Methods", "POST, GET, PATCH, DELETE, PUT");
    next();
});

// le parser JSON qui récupère le payload quand il y en a un et le transforme en objet JS disponible sous request.body
app.use(express.json());

app.use('/api', router);

// ici, on pourrait aussi écrire notre 404

app.listen(port, () => {
    console.log(`Listening on http://localhost:${port}`)
});
