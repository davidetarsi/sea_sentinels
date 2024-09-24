import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/data/local_fish_collection.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'diving_model.freezed.dart';
part "diving_model.g.dart";

enum SoilType {
  sandy,
  rocky,
  other,
}

extension SoilTypeExtension on SoilType {

  static SoilType fromJson(String json) {
    switch (json) {
      case 'sandy':
        return SoilType.sandy;
      case 'rocky':
        return SoilType.rocky;
      case 'other':
        return SoilType.other;
      default:
        return SoilType.sandy;
    }
  }
}

@freezed
class Diving with _$Diving {
  const Diving._();
  factory Diving({
    required String id,
    required LatLng position,
    required String divingSchool,
    required String city,
    required String province,
    required DateTime date,
    required int maxDepth,
    required int maxDurationDepth,
    required double temperature,
    required Duration duration,
    required SoilType soil,
    required List<FishItem> fishList,
  }) = _Diving;


  @override
  String toString() {
    return 'Diving{id: $id, position: $position, divingSchool: $divingSchool, city: $city, province: $province, date: $date, maxDepth: $maxDepth, temperature: $temperature, duration: $duration, fishList: $fishList}';
  }

  List<String> getFishNames() {
    return fishList.map((fishItem) => fishItem.fish.name).toList();
  }

  bool isInRange(DateTime start, DateTime end) {
    return date.isAfter(start) && date.isBefore(end);
  }

  Diving copyWithDiving(Diving newDiving) {
    return Diving(
      id: newDiving.id,
      position: newDiving.position,
      divingSchool: newDiving.divingSchool,
      city: newDiving.city,
      province: newDiving.province,
      date: newDiving.date,
      maxDepth: newDiving.maxDepth,
      maxDurationDepth: newDiving.maxDurationDepth,
      temperature: newDiving.temperature,
      duration: newDiving.duration,
      soil: newDiving.soil,
      fishList: newDiving.fishList,
    );
  }

  factory Diving.fromJson(Map<String, dynamic> json, String id) => _$DivingFromJson(json, id);


  factory Diving.empty() {
    return Diving(
      id: '',
      position: const LatLng(0, 0),
      divingSchool: '',
      city: '',
      province: '',
      date: DateTime.now(),
      maxDepth: 0,
      maxDurationDepth: 0,
      temperature: 0,
      duration: const Duration(),
      soil: SoilType.sandy,
      fishList: [],
    );
  }

   // Metodo fromJson
  factory Diving.fromJsonFirebase(Map<String, dynamic> json, String id, FishData fishData) {
    return Diving(
      id: id,
      position: LatLng.fromJson(json['position'] as Map<String, dynamic>),
      divingSchool: json['divingSchool'],
      city: json['city'],
      province: json['province'],
      date: dateFormat.parse('${json['date'] as String} ${json['time']as String}'),
      maxDepth: json['maxDepth'],
      maxDurationDepth: json['maxDurationDepth'],
      temperature: json['temperature'],
      duration: Duration(minutes: json['duration']),
      soil: SoilTypeExtension.fromJson(json['soil']),
      fishList: (json['fishList'] as List)
          .map((fishItemJson) => FishItem.fromJsonFirebase(fishItemJson, fishData))
          .toList(),
    );
  }
}
/*

class Diving {
  Diving({
    required this.position,
    required this.divingSchool,
    required this.city,
    required this.province,
    required this.date,
    required this.maxDepth,
    required this.temperature,
    required this.duration,
    required this.fishList,
  }) : id = const Uuid().v4();

  factory Diving.empty() {
    return Diving(
      position: const LatLng(0, 0),
      divingSchool: '',
      city: '',
      province: '',
      date: DateTime.now(),
      maxDepth: 0,
      temperature: 0,
      duration: const Duration(),
      fishList: [],
    );
  }

  Diving.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        position = LatLng(
          json['position']['lat'] as double,
          json['position']['lng'] as double,
        ),
        divingSchool = json['divingSchool'] as String,
        city = json['city'] as String,
        province = json['province'] as String,
        date = DateTime.parse(json['date'] as String),
        maxDepth = json['maxDepth'] as int,
        temperature = json['temperature'] as double,
        duration = Duration(minutes: json['duration'] as int),
        fishList = (json['fishList'] as List)
            .map((fishJson) => Fish.fromJson(fishJson as Map<String, dynamic>))
            .toList();
  String? id;
  LatLng position;
  String divingSchool;
  String city;
  String province;
  DateTime date;
  int maxDepth;
  double temperature;
  Duration duration;
  List<Fish> fishList;

  Diving copyWith({
    String? id,
    LatLng? position,
    String? divingSchool,
    String? city,
    String? province,
    DateTime? date,
    int? maxDepth,
    double? temperature,
    Duration? duration,
    List<Fish>? fishList,
  }) {
    return Diving(
      position: position ?? this.position,
      divingSchool: divingSchool ?? this.divingSchool,
      city: city ?? this.city,
      province: province ?? this.province,
      date: date ?? this.date,
      maxDepth: maxDepth ?? this.maxDepth,
      temperature: temperature ?? this.temperature,
      duration: duration ?? this.duration,
      fishList: fishList ?? this.fishList,
    )..id = id ?? this.id;
  }

  LatLng get getPosition => position;

  Marker get getMarker => Marker(
        point: position,
        child: mapIcon,
      );
  void setId(String id) => this.id = id;

  String? get getId => id;

  void setPosition(LatLng position) => this.position = position;

  String get getDivingSchool => divingSchool;

  void setDivingSchool(String divingSchool) => this.divingSchool = divingSchool;

  String get getCity => city;

  void setCity(String city) => this.city = city;

  String get getProvince => province;

  void setProvince(String province) => this.province = province;

  DateTime get getDate => date;

  void setDate(DateTime date) => this.date = date;

  int get getMaxDepth => maxDepth;

  void setMaxDepth(int maxDepth) => this.maxDepth = maxDepth;

  double get getTemperature => temperature;

  void setTemperature(double temperature) => this.temperature = temperature;

  Duration get getDuration => duration;

  void setDuration(Duration duration) => this.duration = duration;

  List<Fish> get getFishList => fishList;

  void setFishList(List<Fish> fishList) => this.fishList = fishList;

  @override
  String toString() {
    return 'Diving{id: $id, position: $position, divingSchool: $divingSchool, city: $city, province: $province, date: $date, maxDepth: $maxDepth, temperature: $temperature, duration: $duration, fishList: $fishList}';
  }

  List<String> getFishNames() {
    return fishList.map((fish) => fish.name).toList();
  }

  bool isInRange(DateTime start, DateTime end) {
    return date.isAfter(start) && date.isBefore(end);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': {'lat': position.latitude, 'lng': position.longitude},
      'divingSchool': divingSchool,
      'city': city,
      'province': province,
      'date': date.toIso8601String(),
      'maxDepth': maxDepth,
      'temperature': temperature,
      'duration': duration.inMinutes,
      'fishList': fishList.map((fish) => fish.toJson()).toList(),
    };
  }

  Diving getSetPrimaryData(
    LatLng position,
    String divingSchool,
    String city,
    String province,
    DateTime date,
    int maxDepth,
    double temperature,
    Duration duration,
  ) {
    setPrimaryData(
      position,
      divingSchool,
      city,
      province,
      date,
      maxDepth,
      temperature,
      duration,
    );
    print("!!!DEBUG!!!");
    print("Diving data changed: ${toString()}");
    return this;
  }

  void setPrimaryData(
    LatLng position,
    String divingSchool,
    String city,
    String province,
    DateTime date,
    int maxDepth,
    double temperature,
    Duration duration,
  ) {
    setPosition(position);
    setDivingSchool(divingSchool);
    setCity(city);
    setProvince(province);
    setDate(date);
    setMaxDepth(maxDepth);
    setTemperature(temperature);
    setDuration(duration);
  }

  Diving getResetData() {
    print("!!!DEBUG!!!");
    print('Previous Diving: ${toString()}');
    final diving = getSetPrimaryData(
      const LatLng(5, 5),
      '',
      '',
      '',
      DateTime.now(),
      0,
      0,
      const Duration(),
    );
    diving.setFishList([]);
    diving.setId(const Uuid().v4());
    print(diving);
    return diving;
  }

  void resetData() {
    print('Previous Diving: ${toString()}');
    setPrimaryData(
      const LatLng(5, 5),
      '',
      '',
      '',
      DateTime.now(),
      0,
      0,
      const Duration(),
    );
    setFishList([]);
    setId(const Uuid().v4());
    print(toString());
  }
}*/