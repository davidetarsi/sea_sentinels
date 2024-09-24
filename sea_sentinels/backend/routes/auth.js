const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const { registerValidation, loginValidation } = require('../validators/auth');

router.post('/register', async (req, res) => {
  // Validazione dei dati
  const { error } = registerValidation(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  // Controllo se l'email esiste già
  const emailExist = await User.findOne({ email: req.body.email });
  if (emailExist) return res.status(400).send('Email already exists');

  // Hash della password
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(req.body.password, salt);

  // Creazione del nuovo utente
  const user = new User({
    name: req.body.name,
    email: req.body.email,
    password: hashedPassword
  });

  try {
    const savedUser = await user.save();
    const token = jwt.sign({ _id: savedUser._id }, process.env.TOKEN_SECRET);
    res.header('auth-token', token).send({ token });
  } catch (err) {
    res.status(400).send(err);
  }
});

router.post('/login', async (req, res) => {
  // Validazione dei dati
  const { error } = loginValidation(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  // Controllo se l'email esiste
  const user = await User.findOne({ email: req.body.email });
  if (!user) return res.status(400).send('Email or password is wrong');

  // Controllo della password
  const validPass = await bcrypt.compare(req.body.password, user.password);
  if (!validPass) return res.status(400).send('Email or password is wrong');

  // Creazione e assegnazione del token
  const token = jwt.sign({ _id: user._id }, process.env.TOKEN_SECRET);
  res.header('auth-token', token).send({ token });
});

module.exports = router;