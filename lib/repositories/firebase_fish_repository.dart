import 'package:sea_sentinels/data/local_fish_collection.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/model/fish_model.dart';
import 'package:sea_sentinels/repositories/diving_repository.dart';
import 'package:sea_sentinels/repositories/fish_repository.dart';

class FirebaseFishRepository implements FishRepository {
  late final FishData fishVault;
  final FishRepositoryRef ref;
  DivingRepository? divingRepository;

  FirebaseFishRepository(this.ref);

  @override
  Future<bool> init() async {
    fishVault = await ref.watch(fishDataProvider.future);
    divingRepository = await ref.watch(divingRepositoryProvider.future);
    print('Fish repository initialized');
    return Future.value(true);
  }

  @override
  Future<List<FishItem>> fetchFishCollection() async {
    //TODO: da sistemare quando ci sarà il db
    List<Diving> dives = await divingRepository!.getAllDives();
    print('Dives fetched');
    print(dives);
    List<FishItem> divesFishList = [];
    for (Diving dive in dives) {
      for (FishItem fishItem in dive.fishList) {
        if (!divesFishList.contains(fishItem)) {
          divesFishList.add(fishItem);
        }
      }
    }
    updateFishCollection(divesFishList);
    print('Fish collection fetched');
    return fishVault.fishCollection;
  }

  @override
  Future<List<FishItem>> getFishCollection() async {
    return fishVault.fishCollection;
  }

  @override
  Future<int> getFishCollectionSize() async {
    return fishVault.fishCollection.length;
  }

  @override
  Future<void> addFish(FishItem fishItem) async {
    fishVault.addFishItem(fishItem);
  }

  @override
  Future<void> updateFishCollection(List<FishItem> newFishList) async {
    for (FishItem fishItem in newFishList) {
      String newFishName = fishItem.fish.name;
      fishVault.fishCollection
          .removeWhere((FishItem fish) => fish.fish.name == newFishName);
      fishVault.fishCollection.add(fishItem);
    }
    print('Fish collection updated');
    fishVault.fishCollection.sort((fishItemA, fishItemB) =>
        fishItemA.fish.name.compareTo(fishItemB.fish.name));
    print('Fish collection sorted');
  }

  @override
  List<Fish> getFishList() {
    return fishVault.fishList;
  }
}
