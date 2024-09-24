require('dotenv').config();
const express = require('express');
const app = express();
const connectDB = require('./config/database');
const authRoute = require('./routes/auth');

// Connessione al database
connectDB();

// Middleware
app.use(express.json());

// Route Middlewares
app.use('/api/user', authRoute);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));