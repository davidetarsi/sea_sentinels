import 'package:sea_sentinels/model/diving_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sea_sentinels/repositories/diving_repository.dart';

part 'diving_provider.g.dart';

@Riverpod(keepAlive: true)
class DivingNotifier extends _$DivingNotifier {
  DivingRepository? repository;

  @override
  Future<Diving> build() async {
    repository = await ref.watch(divingRepositoryProvider.future);
    return Diving.empty();
  }

  Future<void> setPrimaryData(Diving diving) async {
    state = const AsyncLoading();
    try {
      final updatedDiving = await repository!.setPrimaryData(diving);
      state = AsyncData(updatedDiving);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  String getId() {
    return repository!.getId();
  }

  Future<void> updateDiving(Diving diving) async {
    state = const AsyncLoading();
    try {
      state = AsyncData(diving);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
    print("!!!!! diving aggiornata!!!!!!");
  }

  Diving getDiving() {
    if (state.value != null) {
      return state.value!;
    } else {
      return Diving.empty();
    }
  }
}


/* class DivingNotifier extends StateNotifier<Diving> {
  //final yesterday = DateTime.now().subtract(const Duration(days: 2));
  DivingNotifier()
      : super(Diving(
          position: const LatLng(0, 0),
          divingSchool: '',
          city: '',
          province: '',
          date: DateTime.now().subtract(const Duration(days: 2)),
          maxDepth: 0,
          temperature: 0,
          duration: const Duration(),
          fishList: [],
        ));

  void setPrimaryData(
      LatLng position,
      String divingSchool,
      String city,
      String province,
      DateTime date,
      int maxDepth,
      double temperature,
      Duration duration) {
    state = state.getSetPrimaryData(
      position,
      divingSchool,
      city,
      province,
      date,
      maxDepth,
      temperature,
      duration,
    );
  }

  void resetData() {
    state = state.getResetData();
  }
}

final divingProvider = StateNotifierProvider<DivingNotifier, Diving>((ref) {
  return DivingNotifier();
});

 final divingProvider2 = Provider((ref) => DivingProviderr());

class DivingProviderr {
  //final yesterday = DateTime.now().subtract(const Duration(days: 2));
  DivingProviderr();

  Diving baseDiving = Diving(
    position: const LatLng(0, 0),
    divingSchool: '',
    city: '',
    province: '',
    date: DateTime.now().subtract(const Duration(days: 2)),
    maxDepth: 0,
    temperature: 0,
    duration: const Duration(),
    fishList: [],
  );

  void setPrimaryData(
      LatLng position,
      String divingSchool,
      String city,
      String province,
      DateTime date,
      int maxDepth,
      double temperature,
      Duration duration) {
    baseDiving.getSetPrimaryData(
      position,
      divingSchool,
      city,
      province,
      date,
      maxDepth,
      temperature,
      duration,
    );
  }

  void resetData() {
    baseDiving.getResetData();
  }
} */
