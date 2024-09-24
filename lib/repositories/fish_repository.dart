import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/model/fish_model.dart';
import 'package:sea_sentinels/repositories/db_fish_repository.dart';
import 'package:sea_sentinels/repositories/firebase_fish_repository.dart';

part "fish_repository.g.dart";

@Riverpod(keepAlive: true)
Future<FishRepository> fishRepository(FishRepositoryRef ref) async {
  //throw UnimplementedError();
  //TODO crea e instanzia la repository che ti serve (db? file? mock?)
  final repository = DbFishRepository(ref);
  await repository.init();
  return repository;
}

abstract class FishRepository {
  Future<bool> init();
  Future<void> addFish(FishItem fishItem);
  //Future<Fish> removeFish(String id);
  List<Fish> getFishList();
  Future<List<FishItem>> fetchFishCollection();
  Future<List<FishItem>> getFishCollection();
  Future<int> getFishCollectionSize();
  /* Future<List<Fish>> getFishListByLocation(
    String location, {
    int page = 0,
    int pageSize = 10,
  }); */
  void updateFishCollection(List<FishItem> newFishList);

  /* Future<void> addDiving(Diving diving);
  Future<Diving> getDiving(String id);
  Future<List<Diving>> getAllDives();
  String getId();
  // di solito non si mette mai un getAll perchè non è efficiente
  // meglio usare un paginatore e filtrare su un parametro
  Future<List<Diving>> getDivesByLocation(
    String location, {
    int page = 0,
    int pageSize = 10,
  });
  Future<Diving> updateDiving(Diving diving);
  Future<bool> deleteDiving(String id); */
}
