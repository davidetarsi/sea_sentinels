import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/repositories/fish_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'fish_list_provider.g.dart';


@Riverpod()
Future<List<FishItem>> getFishCollection(GetFishCollectionRef ref) async {
  final FishRepository repository = await ref.read(fishRepositoryProvider.future);
  final fishCollection = repository.fetchFishCollection();
  return fishCollection;
}
