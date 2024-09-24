import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sea_sentinels/data/local_diving_collection.dart';
import 'package:sea_sentinels/data/local_fish_collection.dart';
import 'package:sea_sentinels/repositories/diving_repository.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//TODO tu puoi creare un repository per il db e un altro per leggere json, oppure per fare testing
class FireBaseDivingRepository implements DivingRepository {
  //qua dentro ci saranno le dives che leggiamo dal db o da un file
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late final Future<List<Diving>> divings;
  final DivingRepositoryRef ref;
  String id = '';

  FireBaseDivingRepository(this.ref);

  @override
  Future<bool> init() async {
    id = const Uuid().v4();
    String? userId = await _getCurrentUserId();
    FishData? fishData = await ref.watch(fishDataProvider.future);
    if (userId != null && fishData != null) {
      divings = _fetchUserDives(userId, fishData);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
    //throw UnimplementedError();
  }

  Future<Diving> updateDiving(Diving diving) {
    Diving newDiving = diving.copyWithDiving(diving);
    return Future.value(newDiving);
  }

  Future<List<Diving>> _fetchUserDives(String userId, FishData fishData) async {
    try {
      // Ottieni la sottocollezione 'dives' dell'utente
      QuerySnapshot diveSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('dives')
          .get();

      // Converte i documenti in una lista di oggetti Dive
      return diveSnapshot.docs.map((doc) {
        return Diving.fromJsonFirebase(doc.data() as Map<String, dynamic>, doc.id, fishData);
      }).toList();
    } catch (e) {
      print("Errore durante il fetch delle immersioni: $e");
      return [];
    }
  }

  Future<String?> _getCurrentUserId() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print("!!!!!!!!ID utente non valido");
    }
    return currentUser?.uid;
  }

  @override
  Future<Diving> setPrimaryData(Diving diving) {
    Diving newDiving = diving.copyWith(
      id: id,
      position: diving.position,
      divingSchool: diving.divingSchool,
      city: diving.city,
      province: diving.province,
      date: diving.date,
      maxDepth: diving.maxDepth,
      temperature: diving.temperature,
      duration: diving.duration,
    );
    return Future.value(newDiving);
  }

  @override
  Future<void> addDiving(Diving diving) async {
    // TODO: implement addDiving
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      String uid = currentUser.uid; // ID dell'utente autenticato
      String diveId = diving.id;
      Map<String, dynamic> diveData =
          diving.toJson(); // ID dell'immersione dal file JSON

      // Riferimento alla sottocollezione 'dives' dell'utente
      DocumentReference diveRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('dives')
          .doc(diveId);

      // Inserisci i dati nel documento della sottocollezione
      await diveRef.set(diveData).then((_) {
        print("Immersione aggiunta con successo!");
      }).catchError((error) {
        print("Errore nell'aggiungere l'immersione: $error");
      });
    } else {
      print("Nessun utente autenticato.");
    }
  }

  @override
  Future<Diving> getDivingById(String id) {
    // TODO: implement getDivingById
    throw UnimplementedError();
  }

  @override
  String getId() {
    return id;
  }

  @override
  Future<bool> deleteDiving(String id) {
    // TODO: implement deleteDiving
    throw UnimplementedError();
  }

  @override
  Future<Diving> getDiving(String id) {
    // TODO: implement getDiving
    throw UnimplementedError();
  }

  @override
  Future<List<Diving>> getAllDives() async {
    return divings;
  }

  @override
  Future<List<Diving>> getDivesByLocation(
    String location, {
    int page = 0,
    int pageSize = 10,
  }) {
    // TODO: implement getDivesByLocation
    throw UnimplementedError();
  }
}
