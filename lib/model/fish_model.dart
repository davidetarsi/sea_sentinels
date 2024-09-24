import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';

part 'fish_model.freezed.dart';
part "fish_model.g.dart";

@freezed
class Fish with _$Fish {
  const Fish._();
  factory Fish({
    required String name,
      required String localPath,
      required String wikiPath,
      required List<Quantity> quantities,
  }) = _Fish;


  factory Fish.empty() {
    return Fish(
      name: '',
      localPath: '',
      wikiPath: '',
      quantities: [],
    );
  }



  Uri get wikiUri => Uri.parse(wikiPath);
  String get path => localPath;

  
factory Fish.fromJson(Map<String, dynamic> json) => _$FishFromJson(json);

  /* String camelToUpper(String text) {
    var result = text.replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), r"");
    var finalResult =
        result[0].toUpperCase() + result.substring(1).toLowerCase();
    return finalResult;
  }

  Uri get wikiUri => Uri.parse('$wikiPath${camelToUpper(filename)}');

  String get path => '$localPath$filename.jpg'; 

  @override
  String toString() {
    return "Fish(name: '$name', localPath: '$path', wikiPath: '$wikiUri')";
  } */
}
