import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/repositories/local_diving_repository.dart';
import 'package:sea_sentinels/repositories/firebase_diving_repository.dart';

part "diving_repository.g.dart";

@Riverpod(keepAlive: true)
Future<DivingRepository> divingRepository(DivingRepositoryRef ref) async {
  //throw UnimplementedError();
  //TODO crea e instanzia la repository che ti serve (db? file? mock?)
  final repository = FireBaseDivingRepository(ref);
  await repository.init();
  return repository;
  //!!! non dimenticare di registrare la repository nel main.dart
  //!!!IMPLEMENTARE LA INIT QUANDO SERVE ALL'ESTERNO DEL PROVIDER
}

abstract class DivingRepository {
  Future<bool> init();
  Future<void> addDiving(Diving diving);
  Future<Diving> getDivingById(String id);
  Future<List<Diving>> getAllDives();
  String getId();
  // di solito non si mette mai un getAll perchè non è efficiente
  // meglio usare un paginatore e filtrare su un parametro
  Future<List<Diving>> getDivesByLocation(
    String location, {
    int page = 0,
    int pageSize = 10,
  });
  Future<Diving> setPrimaryData(Diving diving);
  Future<bool> deleteDiving(String id);
}
