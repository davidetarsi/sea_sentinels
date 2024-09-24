// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FishImpl _$$FishImplFromJson(Map<String, dynamic> json) => _$FishImpl(
      name: json['name'] as String,
      localPath: json['localPath'] as String,
      wikiPath: json['wikiPath'] as String,
      quantities: (json['quantities'] as List<dynamic>)
          .map((e) => $enumDecode(_$QuantityEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$FishImplToJson(_$FishImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'localPath': instance.localPath,
      'wikiPath': instance.wikiPath,
      'quantities':
          instance.quantities.map((e) => _$QuantityEnumMap[e]!).toList(),
    };

const _$QuantityEnumMap = {
  Quantity.zero: 'zero',
  Quantity.upToOne: 'upToOne',
  Quantity.upToTwo: 'upToTwo',
  Quantity.upToThree: 'upToThree',
  Quantity.upToFour: 'upToFour',
  Quantity.upToFive: 'upToFive',
  Quantity.upToSix: 'upToSix',
  Quantity.upToSeven: 'upToSeven',
  Quantity.upToTen: 'upToTen',
  Quantity.upToFifteen: 'upToFifteen',
  Quantity.upToThirty: 'upToThirty',
  Quantity.upToForty: 'upToForty',
  Quantity.upToFifty: 'upToFifty',
  Quantity.upToOneHundred: 'upToOneHundred',
  Quantity.upToFiveHundred: 'upToFiveHundred',
  Quantity.upToOneThousand: 'upToOneThousand',
  Quantity.moreThanTwo: 'moreThanTwo',
  Quantity.moreThanThree: 'moreThanThree',
  Quantity.moreThanFour: 'moreThanFour',
  Quantity.moreThanFive: 'moreThanFive',
  Quantity.moreThanSix: 'moreThanSix',
  Quantity.moreThanSeven: 'moreThanSeven',
  Quantity.moreThanTen: 'moreThanTen',
  Quantity.moreThanFifteen: 'moreThanFifteen',
  Quantity.moreThanThirty: 'moreThanThirty',
  Quantity.moreThanForty: 'moreThanForty',
  Quantity.moreThanFifty: 'moreThanFifty',
  Quantity.moreThanOneHundred: 'moreThanOneHundred',
  Quantity.moreThanFiveHundred: 'moreThanFiveHundred',
  Quantity.moreThanOneThousand: 'moreThanOneThousand',
};
