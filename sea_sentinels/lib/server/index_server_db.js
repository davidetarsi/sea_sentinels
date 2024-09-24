const { MongoClient } = require('mongodb');
const express = require('express');
const app = express();
const port = 3000;

// URL di connessione al database MongoDB
const url = 'mongodb://0.0.0.0:27017';
const dbName = 'SeaSentinelsDB';

// Middleware per gestire il corpo delle richieste in formato JSON
app.use(express.json());

 // Avvia il server
 app.listen(port, () => {
    console.log(`Server in ascolto sulla porta ${port}`);
});

// Connessione al database MongoDB
MongoClient.connect(url, { useUnifiedTopology: true }, (err, client) => {
    if (err) {
        console.error('Errore durante la connessione al database:', err);
        return;
    }
    console.log('Connessione al database riuscita');

    /* const db = client.db(dbName);

    // Endpoint per inserire un nuovo documento nel database
    app.post('/insert', async (req, res) => {
        try {
            const collection = db.collection('myCollection');
            const result = await collection.insertOne(req.body);
            console.log('Nuovo documento inserito:', result.ops[0]);
            res.status(201).json(result.ops[0]);
        } catch (error) {
            console.error('Errore durante l\'inserimento del documento:', error);
            res.status(500).send('Errore del server');
        }
    }); */


});











/* const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello, world!');
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
    console.log('Server running on port ' + PORT);
});


const { MongoClient } = require('mongodb');

const uri = 'mongodb://localhost:27017'; // URI di connessione al database
const dbName = 'seaSentinelsDB'; // Nome del database
const collectionName = 'users'; // Nome della raccolta

MongoClient.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true }, (err, client) => {
    if (err) {
        console.error('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Error connecting to MongoDB!!!!!!!!!!!!!!!!!!!!!!!!!!!!!:', err);
        return;
    }

    console.log('Connected to MongoDB');

    const db = client.db(dbName);

    // Creazione della raccolta
    db.createCollection(collectionName, (err, collection) => {
        if (err) {
            console.error('!!!!!!!!!!!!!!!!!!!!!!!!Error creating collection:!!!!!!!!!!!!!!!!!!!!!!!!!', err);
            client.close();
            return;
        }
        console.log('Collection created:', collection.collectionName);
        client.close();
    });
}); */















/* const express = require('express');
const mongoose = require('mongoose');

// Inizializza l'app Express
const app = express();

// Configura il middleware per il parsing del corpo delle richieste
app.use(express.json());

// Connetti al database MongoDB
mongoose.connect('mongodb://localhost:27017/nomedeldatabase', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
    .then(() => {
        console.log('Connessione al database MongoDB avvenuta con successo');
    })
    .catch((error) => {
        console.error('Errore durante la connessione al database MongoDB', error);
    });

// Definisci le tue rotte API qui
app.get('/api/database', (req, res) => {
    res.json({ message: 'Esempio di risposta API' });
});

// Avvia il server
const port = 3000;
app.listen(port, () => {
    console.log(`Server in ascolto sulla porta ${port}`);
}); */