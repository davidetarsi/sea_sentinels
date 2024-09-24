// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diving_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DivingImpl _$$DivingImplFromJson(Map<String, dynamic> json, String id) => _$DivingImpl(
      id: id,
      position: LatLng.fromJson(json['position'] as Map<String, dynamic>),
      divingSchool: json['divingSchool'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
      date: dateFormat.parse('${json['date']} ${json['time']}'),
      maxDepth: (json['maxDepth'] as num).toInt(),
      maxDurationDepth: (json['maxDurationDepth'] as num).toInt(),
      temperature: (json['temperature'] as num).toDouble(),
      duration: Duration(minutes: (json['duration'] as num).toInt()),
      soil: $enumDecode(_$SoilTypeEnumMap, json['soil']),
      fishList: (json['fishList'] as List<dynamic>)
          .map((e) => FishItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DivingImplToJson(_$DivingImpl instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'divingSchool': instance.divingSchool,
      'city': instance.city,
      'province': instance.province,
      'date': dateFormat.format(instance.date).substring(0,10),
      'time': dateFormat.format(instance.date).substring(11),
      'maxDepth': instance.maxDepth,
      'maxDurationDepth': instance.maxDurationDepth,
      'temperature': instance.temperature,
      'duration': instance.duration.inMinutes,
      'soil': _$SoilTypeEnumMap[instance.soil],
      'fishList': instance.fishList.map((FishItem fishItem) => fishItem.toJsonFirebase()).toList(),
    };

const _$SoilTypeEnumMap = {
  SoilType.sandy: 'sandy',
  SoilType.rocky: 'rocky',
  SoilType.other: 'other',
};
