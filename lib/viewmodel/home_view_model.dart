import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';


final connectivityProvider = StateNotifierProvider<ConnectivityProvider, bool>(
    (ref) => ConnectivityProvider());

final locationProvider =
    StateNotifierProvider<LocationProvider, bool>((ref) => LocationProvider());

class ConnectivityProvider extends StateNotifier<bool> {
  ConnectivityProvider() : super(false) {
    init();
  }

  //bool state = false;

  Future<void> init() async {
    state = await InternetConnection().hasInternetAccess;
  }
}

class LocationProvider extends StateNotifier<bool> {
  LocationProvider() : super(false);

  Future<void> init() async {
    final location = Location();
    state = await location.serviceEnabled();
  }

  Future<bool> getUserLocation() async {
    try {
      state = true;
      bool serviceEnabled = await Location.instance.serviceEnabled();
      if (!serviceEnabled) {
        bool isRequestGranted = await Location.instance.requestService();
        if (!isRequestGranted) {
          return false;
        }
      }
      PermissionStatus status = await Location.instance.hasPermission();
      if (status == PermissionStatus.denied) {
        status = await Location.instance.requestPermission();
        if (status != PermissionStatus.granted) {
          return true;
        }
      }
      state = false;
      return true;
    } catch (e) {
      state = false;
      rethrow;
    }
  }
}

/* 

final homeViewModelProvider = Provider((ref) => HomeViewModel());


class HomeViewModel {
  HomeViewModel();

  List<Diving> divingsFalse = [
    Diving(
        position: const LatLng(35, 12.9887),
        divingSchool: 'Schooooooooooooooooooooooooooooooool',
        city: 'Bari',
        province: 'AN',
        date: DateTime.utc(2024, 04, 21),
        maxDepth: 12,
        temperature: 4,
        duration: const Duration(hours: 1),
        fishList: [
          Fish(
            name: 'Box Crab',
            localPath: 'lib/assets/photo/boxCrab.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Boxcrab',
            quantity: Quantity.oneFive,
            isPresent: true,
          ),
          Fish(
            name: 'Chicken Liver Sponge',
            localPath: 'lib/assets/photo/chickenLiverSponge.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Chickenliversponge',
            quantity: Quantity.sixTen,
          ),
          Fish(
            name: 'Common Octopus',
            localPath: 'lib/assets/photo/commonOctopus.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Commonoctopus',
          ),
          Fish(
            name: 'Common Spiny Lobster',
            localPath: 'lib/assets/photo/commonSpinyLobster.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Commonspinylobster',
          ),
        ]),
  ];

  List<Diving> divings = [];

  /*  [
    Diving(
        position: const LatLng(41.13, 16.9887),
        divingSchool: 'Schooooooooooooooooooooooooooooooool',
        city: 'Bari',
        province: 'AN',
        date: DateTime.utc(2024, 04, 21),
        maxDepth: 12,
        temperature: 4,
        duration: const Duration(hours: 1),
        fishList: [
          Fish(
            name: 'Box Crab',
            localPath: 'lib/assets/photo/boxCrab.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Boxcrab',
            quantity: Quantity.oneFive,
            isPresent: true,
          ),
          Fish(
            name: 'Chicken Liver Sponge',
            localPath: 'lib/assets/photo/chickenLiverSponge.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Chickenliversponge',
            quantity: Quantity.sixTen,
          ),
          Fish(
            name: 'Common Octopus',
            localPath: 'lib/assets/photo/commonOctopus.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Commonoctopus',
            quantity: Quantity.sixTen,
          ),
          Fish(
            name: 'Common Spiny Lobster',
            localPath: 'lib/assets/photo/commonSpinyLobster.jpg',
            wikiPath: 'https://en.wikipedia.org/wiki/Commonspinylobster',
          ),
        ]),
    Diving(
        position: const LatLng(43.616667, 13.616667),
        divingSchool: 'School',
        city: 'Ancona',
        province: 'AN',
        date: DateTime.utc(2024, 04, 21),
        maxDepth: 12,
        temperature: 34,
        duration: const Duration(hours: 1),
        fishList: []),
    Diving(
        position: const LatLng(43.55, 10.136667),
        divingSchool: 'School',
        city: 'Ancona',
        province: 'AN',
        date: DateTime.utc(2024, 04, 21),
        maxDepth: 12,
        temperature: 24,
        duration: const Duration(hours: 1),
        fishList: []),
    Diving(
        position: const LatLng(0, 0),
        divingSchool: 'School',
        city: 'Ancona',
        province: 'AN',
        date: DateTime.utc(2024, 04, 21),
        maxDepth: 12,
        temperature: 54,
        duration: const Duration(hours: 1),
        fishList: [])
  ]; */

  //!!!!!!!! DA RIVEDERE PERCHè è TUTTO TEST

  List<Diving> getDivingsList() {
    //!!!!!!! QUANDO CORRETTO, IL METODO CREA UN CICLO INFINITO
    //getJsonDivings();
    //return divingsFalse;
    return divings;
  }

  void addDiving(Diving diving) {
    getDivingsList().add(diving);
    print("Diving added: $diving");

    //divingsFalse.add(diving);
  }

  Diving getDiving(int index) {
    return getDivingsList().elementAt(index);
  }

  void getJsonDivings() {
    /*
    String uri =
        "/Users/davide/Desktop/Personal/Università/Magistrale/Tesi/sea_sentinels_migliorata/lib/server/divingsFile.txt";
    File file = File(uri);
    //!!!!!!!!!Da rimuovere
    file.writeAsStringSync(json.encode(getDiving(0).toJson()));
    //!!!!!!!
    String content = await file.readAsString();
    */
    var jsonEncoded = jsonEncode(getDiving(0).toJson());
    print(jsonEncoded);
    var jsonResponse = jsonDecode(jsonEncoded);
    print("The response is: $jsonResponse");
    addDiving(Diving.fromJson(jsonResponse));
    String? id = Diving.fromJson(jsonResponse).id;
    print("The id is $id");
  }
} */
