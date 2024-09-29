import 'package:sea_sentinels/data/local_diving_collection.dart';
import 'package:sea_sentinels/repositories/diving_repository.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:uuid/uuid.dart';

//TODO tu puoi creare un repository per il db e un altro per leggere json, oppure per fare testing
class LocalDivingRepository implements DivingRepository {
  //qua dentro ci saranno le dives che leggiamo dal db o da un file
  late DivingData divingVault;
  final DivingRepositoryRef ref;
  String id = '';

  LocalDivingRepository(this.ref);

  @override
  Future<bool> init() async {
    id = const Uuid().v4();
    divingVault = await ref.watch(divingDataProvider.future);
    return Future.value(true);
    //throw UnimplementedError();
  }

  Future<Diving> updateDiving(Diving diving) {
    Diving newDiving = diving.copyWithDiving(diving);
    return Future.value(newDiving);
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
    divingVault.divingList.add(diving);
    print("Diving added: $diving");
    print(divingVault.divingList);
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
    return divingVault.divingList;
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
