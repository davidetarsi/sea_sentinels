import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sea_sentinels/data/local_fish_collection.dart';
import 'package:sea_sentinels/model/fish_model.dart';

part 'fish_item_model.g.dart';
part 'fish_item_model.freezed.dart';

enum Quantity {
  zero,
  upToOne,
  upToTwo,
  upToThree,
  upToFour,
  upToFive,
  upToSix,
  upToSeven,
  upToTen,
  upToFifteen,
  upToThirty,
  upToForty,
  upToFifty,
  upToOneHundred,
  upToFiveHundred,
  upToOneThousand,
  moreThanTwo,
  moreThanThree,
  moreThanFour,
  moreThanFive,
  moreThanSix,
  moreThanSeven,
  moreThanTen,
  moreThanFifteen,
  moreThanThirty,
  moreThanForty,
  moreThanFifty,
  moreThanOneHundred,
  moreThanFiveHundred,
  moreThanOneThousand
}

extension QuantityExtension on Quantity {
  // Metodo toJson
  String toJson() {
    switch (this) {
      case Quantity.zero:
        return 'zero';
      case Quantity.upToOne:
        return 'upToOne';
      case Quantity.upToTwo:
        return 'upToTwo';
      case Quantity.upToThree:
        return 'upToThree';
      case Quantity.upToFour:
        return 'upToFour';
      case Quantity.upToFive:
        return 'upToFive';
      case Quantity.upToSix:
        return 'upToSix';
      case Quantity.upToSeven:
        return 'upToSeven';
      case Quantity.upToTen:
        return 'upToTen';
      case Quantity.upToFifteen:
        return 'upToFifteen';
      case Quantity.upToThirty:
        return 'upToThirty';
      case Quantity.upToForty:
        return 'upToForty';
      case Quantity.upToFifty:
        return 'upToFifty';
      case Quantity.upToOneHundred:
        return 'upToOneHundred';
      case Quantity.upToFiveHundred:
        return 'upToFiveHundred';
      case Quantity.upToOneThousand:
        return 'upToOneThousand';
      case Quantity.moreThanTwo:
        return 'moreThanTwo';
      case Quantity.moreThanThree:
        return 'moreThanThree';
      case Quantity.moreThanFour:
        return 'moreThanFour';
      case Quantity.moreThanFive:
        return 'moreThanFive';
      case Quantity.moreThanSix:
        return 'moreThanSix';
      case Quantity.moreThanSeven:
        return 'moreThanSeven';
      case Quantity.moreThanTen:
        return 'moreThanTen';
      case Quantity.moreThanFifteen:
        return 'moreThanFifteen';
      case Quantity.moreThanThirty:
        return 'moreThanThirty';
      case Quantity.moreThanForty:
        return 'moreThanForty';
      case Quantity.moreThanFifty:
        return 'moreThanFifty';
      case Quantity.moreThanOneHundred:
        return 'moreThanOneHundred';
      case Quantity.moreThanFiveHundred:
        return 'moreThanFiveHundred';
      case Quantity.moreThanOneThousand:
        return 'moreThanOneThousand';
    }
  }

  // Metodo fromJson
  static Quantity fromJson(String json) {
    switch (json) {
      case 'zero':
        return Quantity.zero;
      case 'upToOne':
        return Quantity.upToOne;
      case 'upToTwo':
        return Quantity.upToTwo;
      case 'upToThree':
        return Quantity.upToThree;
      case 'upToFour':
        return Quantity.upToFour;
      case 'upToFive':
        return Quantity.upToFive;
      case 'upToSix':
        return Quantity.upToSix;
      case 'upToSeven':
        return Quantity.upToSeven;
      case 'upToTen':
        return Quantity.upToTen;
      case 'upToFifteen':
        return Quantity.upToFifteen;
      case 'upToThirty':
        return Quantity.upToThirty;
      case 'upToForty':
        return Quantity.upToForty;
      case 'upToFifty':
        return Quantity.upToFifty;
      case 'upToOneHundred':
        return Quantity.upToOneHundred;
      case 'upToFiveHundred':
        return Quantity.upToFiveHundred;
      case 'upToOneThousand':
        return Quantity.upToOneThousand;
      case 'moreThanTwo':
        return Quantity.moreThanTwo;
      case 'moreThanThree':
        return Quantity.moreThanThree;
      case 'moreThanFour':
        return Quantity.moreThanFour;
      case 'moreThanFive':
        return Quantity.moreThanFive;
      case 'moreThanSix':
        return Quantity.moreThanSix;
      case 'moreThanSeven':
        return Quantity.moreThanSeven;
      case 'moreThanTen':
        return Quantity.moreThanTen;
      case 'moreThanFifteen':
        return Quantity.moreThanFifteen;
      case 'moreThanThirty':
        return Quantity.moreThanThirty;
      case 'moreThanForty':
        return Quantity.moreThanForty;
      case 'moreThanFifty':
        return Quantity.moreThanFifty;
      case 'moreThanOneHundred':
        return Quantity.moreThanOneHundred;
      case 'moreThanFiveHundred':
        return Quantity.moreThanFiveHundred;
      case 'moreThanOneThousand':
        return Quantity.moreThanOneThousand;
      default:
        throw Exception('Unknown Quantity value: $json');
    }
  }

  // Metodo toString

  String quantityToString() {
    switch (this) {
      case Quantity.zero:
        return 'zero';
      case Quantity.upToOne:
        return 'up to 1';
      case Quantity.upToTwo:
        return 'up to 2';
      case Quantity.upToThree:
        return 'up to 3';
      case Quantity.upToFour:
        return 'up to 4';
      case Quantity.upToFive:
        return 'up to 5';
      case Quantity.upToSix:
        return 'up to 6';
      case Quantity.upToSeven:
        return 'up to 7';
      case Quantity.upToTen:
        return 'up to 10';
      case Quantity.upToFifteen:
        return 'up to 15';
      case Quantity.upToThirty:
        return 'up to 30';
      case Quantity.upToForty:
        return 'up to 40';
      case Quantity.upToFifty:
        return 'up to 50';
      case Quantity.upToOneHundred:
        return 'up to 100';
      case Quantity.upToFiveHundred:
        return 'up to 500';
      case Quantity.upToOneThousand:
        return 'up to 1000';
      case Quantity.moreThanTwo:
        return 'more than 2';
      case Quantity.moreThanThree:
        return 'more than 3';
      case Quantity.moreThanFour:
        return 'more than 4';
      case Quantity.moreThanFive:
        return 'more than 5';
      case Quantity.moreThanSix:
        return 'more than 6';
      case Quantity.moreThanSeven:
        return 'more than 7';
      case Quantity.moreThanTen:
        return 'more than 10';
      case Quantity.moreThanFifteen:
        return 'more than 15';
      case Quantity.moreThanThirty:
        return 'more than 30';
      case Quantity.moreThanForty:
        return 'more than 40';
      case Quantity.moreThanFifty:
        return 'more than 50';
      case Quantity.moreThanOneHundred:
        return 'more than 100';
      case Quantity.moreThanFiveHundred:
        return 'more than 500';
      case Quantity.moreThanOneThousand:
        return 'more than 1000';
    }
  }
}

@freezed
class FishItem with _$FishItem {
  const FishItem._();
  factory FishItem({
    required Fish fish,
    required Quantity quantity,
  }) = _FishItem;

  bool get isPresent => quantity == Quantity.zero ? false : true;

  factory FishItem.fromJson(Map<String, dynamic> json) =>
      _$FishItemFromJson(json);

  factory FishItem.empty() {
    return FishItem(fish: Fish.empty(), quantity: Quantity.zero);
  }

  @override
  String toString() {
    return 'FishItem(fish: ${fish.toString()}, quantity: $quantity)';
  }

  factory FishItem.fromJsonFirebase(Map<String, dynamic> json, FishData fishData) {
    Fish fish = fishData.getFishByName(json['fishName']); // Recupera il pesce completo da FishData
    Quantity quantity = QuantityExtension.fromJson(json['quantity']);

    return FishItem(
      fish: fish,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJsonFirebase() {
    return {
      'fishName': fish.name,
      'quantity': quantity.toJson(),
    };
  }
}
