// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diving_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Diving _$DivingFromJson(Map<String, dynamic> json, String id) {
  return _Diving.fromJson(json, id);
}

/// @nodoc
mixin _$Diving {
  String get id => throw _privateConstructorUsedError;
  LatLng get position => throw _privateConstructorUsedError;
  String get divingSchool => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get maxDepth => throw _privateConstructorUsedError;
  int get maxDurationDepth => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  SoilType get soil => throw _privateConstructorUsedError;
  List<FishItem> get fishList => throw _privateConstructorUsedError;

  /// Serializes this Diving to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Diving
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DivingCopyWith<Diving> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DivingCopyWith<$Res> {
  factory $DivingCopyWith(Diving value, $Res Function(Diving) then) =
      _$DivingCopyWithImpl<$Res, Diving>;
  @useResult
  $Res call(
      {String id,
      LatLng position,
      String divingSchool,
      String city,
      String province,
      DateTime date,
      int maxDepth,
      int maxDurationDepth,
      double temperature,
      Duration duration,
      SoilType soil,
      List<FishItem> fishList});
}

/// @nodoc
class _$DivingCopyWithImpl<$Res, $Val extends Diving>
    implements $DivingCopyWith<$Res> {
  _$DivingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Diving
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? divingSchool = null,
    Object? city = null,
    Object? province = null,
    Object? date = null,
    Object? maxDepth = null,
    Object? maxDurationDepth = null,
    Object? temperature = null,
    Object? duration = null,
    Object? soil = null,
    Object? fishList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng,
      divingSchool: null == divingSchool
          ? _value.divingSchool
          : divingSchool // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxDepth: null == maxDepth
          ? _value.maxDepth
          : maxDepth // ignore: cast_nullable_to_non_nullable
              as int,
      maxDurationDepth: null == maxDurationDepth
          ? _value.maxDurationDepth
          : maxDurationDepth // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      soil: null == soil
          ? _value.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as SoilType,
      fishList: null == fishList
          ? _value.fishList
          : fishList // ignore: cast_nullable_to_non_nullable
              as List<FishItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DivingImplCopyWith<$Res> implements $DivingCopyWith<$Res> {
  factory _$$DivingImplCopyWith(
          _$DivingImpl value, $Res Function(_$DivingImpl) then) =
      __$$DivingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      LatLng position,
      String divingSchool,
      String city,
      String province,
      DateTime date,
      int maxDepth,
      int maxDurationDepth,
      double temperature,
      Duration duration,
      SoilType soil,
      List<FishItem> fishList});
}

/// @nodoc
class __$$DivingImplCopyWithImpl<$Res>
    extends _$DivingCopyWithImpl<$Res, _$DivingImpl>
    implements _$$DivingImplCopyWith<$Res> {
  __$$DivingImplCopyWithImpl(
      _$DivingImpl _value, $Res Function(_$DivingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Diving
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? divingSchool = null,
    Object? city = null,
    Object? province = null,
    Object? date = null,
    Object? maxDepth = null,
    Object? maxDurationDepth = null,
    Object? temperature = null,
    Object? duration = null,
    Object? soil = null,
    Object? fishList = null,
  }) {
    return _then(_$DivingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng,
      divingSchool: null == divingSchool
          ? _value.divingSchool
          : divingSchool // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maxDepth: null == maxDepth
          ? _value.maxDepth
          : maxDepth // ignore: cast_nullable_to_non_nullable
              as int,
      maxDurationDepth: null == maxDurationDepth
          ? _value.maxDurationDepth
          : maxDurationDepth // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      soil: null == soil
          ? _value.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as SoilType,
      fishList: null == fishList
          ? _value._fishList
          : fishList // ignore: cast_nullable_to_non_nullable
              as List<FishItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DivingImpl extends _Diving {
  _$DivingImpl(
      {required this.id,
      required this.position,
      required this.divingSchool,
      required this.city,
      required this.province,
      required this.date,
      required this.maxDepth,
      required this.maxDurationDepth,
      required this.temperature,
      required this.duration,
      required this.soil,
      required final List<FishItem> fishList})
      : _fishList = fishList,
        super._();

  factory _$DivingImpl.fromJson(Map<String, dynamic> json, String id) =>
      _$$DivingImplFromJson(json, id);

  @override
  final String id;
  @override
  final LatLng position;
  @override
  final String divingSchool;
  @override
  final String city;
  @override
  final String province;
  @override
  final DateTime date;
  @override
  final int maxDepth;
  @override
  final int maxDurationDepth;
  @override
  final double temperature;
  @override
  final Duration duration;
  @override
  final SoilType soil;
  final List<FishItem> _fishList;
  @override
  List<FishItem> get fishList {
    if (_fishList is EqualUnmodifiableListView) return _fishList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fishList);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DivingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.divingSchool, divingSchool) ||
                other.divingSchool == divingSchool) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.maxDepth, maxDepth) ||
                other.maxDepth == maxDepth) &&
            (identical(other.maxDurationDepth, maxDurationDepth) ||
                other.maxDurationDepth == maxDurationDepth) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.soil, soil) || other.soil == soil) &&
            const DeepCollectionEquality().equals(other._fishList, _fishList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      position,
      divingSchool,
      city,
      province,
      date,
      maxDepth,
      maxDurationDepth,
      temperature,
      duration,
      soil,
      const DeepCollectionEquality().hash(_fishList));

  /// Create a copy of Diving
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DivingImplCopyWith<_$DivingImpl> get copyWith =>
      __$$DivingImplCopyWithImpl<_$DivingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DivingImplToJson(
      this,
    );
  }
}

abstract class _Diving extends Diving {
  factory _Diving(
      {required final String id,
      required final LatLng position,
      required final String divingSchool,
      required final String city,
      required final String province,
      required final DateTime date,
      required final int maxDepth,
      required final int maxDurationDepth,
      required final double temperature,
      required final Duration duration,
      required final SoilType soil,
      required final List<FishItem> fishList}) = _$DivingImpl;
  _Diving._() : super._();

  factory _Diving.fromJson(Map<String, dynamic> json, String id) = _$DivingImpl.fromJson;

  @override
  String get id;
  @override
  LatLng get position;
  @override
  String get divingSchool;
  @override
  String get city;
  @override
  String get province;
  @override
  DateTime get date;
  @override
  int get maxDepth;
  @override
  int get maxDurationDepth;
  @override
  double get temperature;
  @override
  Duration get duration;
  @override
  SoilType get soil;
  @override
  List<FishItem> get fishList;

  /// Create a copy of Diving
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DivingImplCopyWith<_$DivingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
