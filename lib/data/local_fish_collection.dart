import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/model/fish_model.dart';

part 'local_fish_collection.g.dart';

@Riverpod(keepAlive: true)
Future<FishData> fishData(FishDataRef ref) async {
  final fishData = await FishData().init();
  return fishData;
}

class FishData {
  FishData();
  final List<Fish> _fishList = [
    Fish(
      name: "Angler Fish",
      localPath: "lib/assets/photo/anglerFish.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Anglerfish",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree
      ],
    ),
    Fish(
      name: "Box Crab",
      localPath: "lib/assets/photo/boxCrab.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Brown_box_crab",
      quantities: [Quantity.upToTwo, Quantity.upToFour, Quantity.moreThanFour],
    ),
    Fish(
      name: "Chicken Liver Sponge",
      localPath: "lib/assets/photo/chickenLiverSponge.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Chondrilla_nucula",
      quantities: [
        Quantity.upToTen,
        Quantity.upToOneHundred,
        Quantity.moreThanOneHundred
      ],
    ),
    Fish(
      name: "Common Octopus",
      localPath: "lib/assets/photo/commonOctopus.jpg",
      wikiPath: "https://it.wikipedia.org/wiki/Octopus_vulgaris",
      quantities: [Quantity.upToTwo, Quantity.upToFour, Quantity.moreThanFour],
    ),
    Fish(
      name: "Common Spiny Lobster",
      localPath: "lib/assets/photo/commonSpinyLobster.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Spiny_lobster",
      quantities: [Quantity.upToTwo, Quantity.upToFour, Quantity.moreThanFour],
    ),
    Fish(
      name: "Common Torpedo",
      localPath: "lib/assets/photo/commonTorpedo.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Common_torpedo",
      quantities: [Quantity.upToOne, Quantity.upToTwo, Quantity.moreThanTwo],
    ),
    Fish(
      name: "Cuttlefish",
      localPath: "lib/assets/photo/cuttlefish.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Cuttlefish",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree
      ],
    ),
    Fish(
      name: "Cylinder Anemone",
      localPath: "lib/assets/photo/cylinderAnemone.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Cerianthus_membranaceus",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Damselfish",
      localPath: "lib/assets/photo/damselfish.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Chromis_chromis",
      quantities: [
        Quantity.upToTen,
        Quantity.upToOneHundred,
        Quantity.moreThanOneHundred
      ],
    ),
    Fish(
      name: "Dotted Sea Slug",
      localPath: "lib/assets/photo/dottedSeaSlug.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Peltodoris_atromaculata",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Dusky Grouper",
      localPath: "lib/assets/photo/duskyGrouper.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Epinephelus_marginatus",
      quantities: [Quantity.upToTwo, Quantity.upToFour, Quantity.moreThanFour],
    ),
    Fish(
      name: "European Lobster",
      localPath: "lib/assets/photo/EuropeanLobster.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Homarus_gammarus",
      quantities: [Quantity.upToOne, Quantity.upToTwo, Quantity.moreThanTwo],
    ),
    Fish(
      name: "False Coral",
      localPath: "lib/assets/photo/falseCoral.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Myriapora_truncata",
      quantities: [
        Quantity.upToTen,
        Quantity.upToOneHundred,
        Quantity.moreThanOneHundred
      ],
    ),
    Fish(
      name: "Fan Shell",
      localPath: "lib/assets/photo/fanShell.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Fanshell",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Feather Star",
      localPath: "lib/assets/photo/featherStar.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Elegant_feather_star",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Flying Gurnard",
      localPath: "lib/assets/photo/flyingGurnard.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Flying_gurnard",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree
      ],
    ),
    Fish(
      name: "Giant Tun",
      localPath: "lib/assets/photo/giantTun.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Tonna_galea",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree
      ],
    ),
    Fish(
      name: "John Dory",
      localPath: "lib/assets/photo/JohnDory.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/John_Dory",
      quantities: [Quantity.upToTwo, Quantity.upToFour, Quantity.moreThanFour],
    ),
    Fish(
      name: "Long Snouted Branched Seahorse",
      localPath: "lib/assets/photo/longSnoutedBranchedSeahorse.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Long-snouted_seahorse",
      quantities: [Quantity.upToOne, Quantity.upToTwo, Quantity.moreThanTwo],
    ),
    Fish(
      name: "Marine Litter",
      localPath: "lib/assets/photo/marineLitter.jpg",
      wikiPath:
          "https://www.unep.org/topics/ocean-seas-and-coasts/regional-seas-programme/marine-litter",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree
      ],
    ),
    Fish(
      name: "Mediterranean Fanworm",
      localPath: "lib/assets/photo/MediterraneanFanworm.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Sabella_spallanzanii",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Mermaids Wine Glass",
      localPath: "lib/assets/photo/mermaidsWineGlass.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Acetabularia_crenulata",
      quantities: [
        Quantity.upToOneHundred,
        Quantity.upToOneThousand,
        Quantity.moreThanOneThousand
      ],
    ),
    Fish(
      name: "Moray Eel",
      localPath: "lib/assets/photo/morayEel.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Moray_eel",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Neptune Grass",
      localPath: "lib/assets/photo/neptuneGrass.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Posidonia_oceanica",
      quantities: [
        Quantity.upToOneHundred,
        Quantity.upToOneThousand,
        Quantity.moreThanOneThousand
      ],
    ),
    Fish(
      name: "Pentagon Sea Star",
      localPath: "lib/assets/photo/pentagonSeaStar.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Pentagonaster_(starfish)",
      quantities: [Quantity.upToTwo, Quantity.upToFive, Quantity.moreThanFive],
    ),
    Fish(
      name: "Precious Red Coral",
      localPath: "lib/assets/photo/preciousRedCoral.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Precious_coral",
      quantities: [
        Quantity.upToTen,
        Quantity.upToOneHundred,
        Quantity.moreThanOneHundred
      ],
    ),
    Fish(
      name: "Purple Dye Murex",
      localPath: "lib/assets/photo/purpleDyeMurex.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Bolinus_brandaris",
      quantities: [
        Quantity.upToThree,
        Quantity.upToFive,
        Quantity.moreThanFive
      ],
    ),
    Fish(
      name: "Rainbow Wrasse",
      localPath: "lib/assets/photo/rainbowWrasse.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Mediterranean_rainbow_wrasse",
      quantities: [Quantity.upToFour, Quantity.upToTen, Quantity.moreThanTen],
    ),
    Fish(
      name: "Red Dead Mens Fingers",
      localPath: "lib/assets/photo/redDeadMensFingers.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Alcyonium_palmatum",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree
      ],
    ),
    Fish(
      name: "Red Lance Urchin",
      localPath: "lib/assets/photo/redLanceUrchin.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Stylocidaris_affinis",
      quantities: [Quantity.upToTwo, Quantity.upToFour, Quantity.moreThanFour],
    ),
    Fish(
      name: "Red Sea Squirt",
      localPath: "lib/assets/photo/redSeaSquirt.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Halocynthia_papillosa",
      quantities: [
        Quantity.upToThree,
        Quantity.upToSix,
        Quantity.moreThanSix,
      ],
    ),
    Fish(
      name: "Royal Cucumber",
      localPath: "lib/assets/photo/royalCucumber.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Parastichopus_regalis",
      quantities: [
        Quantity.upToTwo,
        Quantity.upToSeven,
        Quantity.moreThanSeven,
      ],
    ),
    Fish(
      name: "Salema",
      localPath: "lib/assets/photo/salema.jpg",
      wikiPath: "https://it.wikipedia.org/wiki/Sarpa_salpa",
      quantities: [
        Quantity.upToFive,
        Quantity.upToFifty,
        Quantity.moreThanFifty,
      ],
    ),
    Fish(
      name: "Sea Lace",
      localPath: "lib/assets/photo/seaLace.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Chorda_filum",
      quantities: [
        Quantity.upToTen,
        Quantity.upToOneHundred,
        Quantity.moreThanOneHundred,
      ],
    ),
    Fish(
      name: "Sea Raven",
      localPath: "lib/assets/photo/seaRaven.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Hemitripterinae",
      quantities: [
        Quantity.upToTwo,
        Quantity.upToFive,
        Quantity.moreThanFive,
      ],
    ),
    Fish(
      name: "Sea Rose",
      localPath: "lib/assets/photo/seaRose.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Manicina_areolata",
      quantities: [
        Quantity.upToTen,
        Quantity.upToOneHundred,
        Quantity.moreThanOneHundred,
      ],
    ),
    Fish(
      name: "Short Snouted Seahorse",
      localPath: "lib/assets/photo/shortSnoutedSeahorse.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Short-snouted_seahorse",
      quantities: [
        Quantity.upToOne,
        Quantity.upToTwo,
        Quantity.moreThanTwo,
      ],
    ),
    Fish(
      name: "Smooth Brittlestar",
      localPath: "lib/assets/photo/smoothBrittlestar.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Brittle_star",
      quantities: [
        Quantity.upToTwo,
        Quantity.upToFive,
        Quantity.moreThanFive,
      ],
    ),
    Fish(
      name: "Snakelocks Anemone",
      localPath: "lib/assets/photo/snakelocksAnemone.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Snakelocks_anemone",
      quantities: [
        Quantity.upToFifteen,
        Quantity.upToForty,
        Quantity.moreThanForty,
      ],
    ),
    Fish(
      name: "Spider Crab",
      localPath: "lib/assets/photo/spiderCrab.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Maja_squinado",
      quantities: [
        Quantity.upToThree,
        Quantity.upToFive,
        Quantity.moreThanFive,
      ],
    ),
    Fish(
      name: "Stony Sponge",
      localPath: "lib/assets/photo/stonySponge.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Petrosia_ficiformis",
      quantities: [
        Quantity.upToTwo,
        Quantity.upToFive,
        Quantity.moreThanFive,
      ],
    ),
    Fish(
      name: "Thornback Ray",
      localPath: "lib/assets/photo/thornbackRay.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Thornback_ray",
      quantities: [
        Quantity.upToOne,
        Quantity.upToTwo,
        Quantity.moreThanTwo,
      ],
    ),
    Fish(
      name: "Violescent Sea Whip",
      localPath: "lib/assets/photo/violescentSeaWhip.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Paramuricea_clavata",
      quantities: [
        Quantity.upToThree,
        Quantity.upToTen,
        Quantity.moreThanTen,
      ],
    ),
    Fish(
      name: "Wing Shell",
      localPath: "lib/assets/photo/wingShell.jpg",
      wikiPath: "https://en.wikipedia.org/wiki/Cyrtopleura_costata",
      quantities: [
        Quantity.upToOne,
        Quantity.upToThree,
        Quantity.moreThanThree,
      ],
    ),
    Fish(
      name: "Yellow Cluster Anemone",
      localPath: "lib/assets/photo/yellowClusterAnemone.jpg",
      wikiPath: "https://it.wikipedia.org/wiki/Parazoanthus_axinellae",
      quantities: [
        Quantity.upToOneHundred,
        Quantity.upToOneThousand,
        Quantity.moreThanOneThousand,
      ],
    ),
  ];

  List<FishItem> _fishCollection = [];

  List<Fish> get fishList => _fishList;
  List<FishItem> get fishCollection => _fishCollection;

  Future<FishData> init() {
    _fishCollection = _fishList
        .map((fish) => FishItem(fish: fish, quantity: Quantity.zero))
        .toList();
    return Future.value(this);
  }

  void addFishItem(FishItem fishItem) {
    _fishCollection.add(fishItem);
  }

  Fish getFishByName(String name) {
    return _fishList.firstWhere((fish) => fish.name == name);
  }
}
