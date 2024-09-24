import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sea_sentinels/model/diving_model.dart';

part 'local_diving_collection.g.dart';

@Riverpod(keepAlive: true)
Future<DivingData> divingData(DivingDataRef ref) async {
  final divingData = DivingData();
  return divingData;
}

class DivingData {
  final List<Diving> _divingList = [];

  List<Diving> get divingList => _divingList;

  void addDiving(Diving diving) {
    _divingList.add(diving);
  }
}
