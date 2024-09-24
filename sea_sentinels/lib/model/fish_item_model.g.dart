// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FishItemImpl _$$FishItemImplFromJson(Map<String, dynamic> json) =>
    _$FishItemImpl(
      fish: Fish.fromJson(json['fish'] as Map<String, dynamic>),
      quantity: $enumDecode(_$QuantityEnumMap, json['quantity']),
    );

Map<String, dynamic> _$$FishItemImplToJson(_$FishItemImpl instance) =>
    <String, dynamic>{
      'fish': instance.fish.toJson(),
      'quantity': _$QuantityEnumMap[instance.quantity]!,
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
