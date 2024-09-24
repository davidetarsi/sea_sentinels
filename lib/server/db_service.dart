import 'package:mongo_dart/mongo_dart.dart';

void insertProva() async {
  // Connessione al server Node.js
  final db = Db('mongodb://localhost:3000');
  await db.open();

  // Dati del nuovo documento
  final newData = {"_id": 'sghssjsjjsjsj', 'name': 'John', 'age': 30};

  // Inserimento del documento nel database
  await db.collection('admin.users').insert(newData);

  print('Nuovo documento inserito nel database');

  // Chiusura della connessione
  await db.close();
}