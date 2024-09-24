// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fish_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Fish _$FishFromJson(Map<String, dynamic> json) {
  return _Fish.fromJson(json);
}

/// @nodoc
mixin _$Fish {
  String get name => throw _privateConstructorUsedError;
  String get localPath => throw _privateConstructorUsedError;
  String get wikiPath => throw _privateConstructorUsedError;
  List<Quantity> get quantities => throw _privateConstructorUsedError;

  /// Serializes this Fish to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FishCopyWith<Fish> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FishCopyWith<$Res> {
  factory $FishCopyWith(Fish value, $Res Function(Fish) then) =
      _$FishCopyWithImpl<$Res, Fish>;
  @useResult
  $Res call(
      {String name,
      String localPath,
      String wikiPath,
      List<Quantity> quantities});
}

/// @nodoc
class _$FishCopyWithImpl<$Res, $Val extends Fish>
    implements $FishCopyWith<$Res> {
  _$FishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? localPath = null,
    Object? wikiPath = null,
    Object? quantities = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      wikiPath: null == wikiPath
          ? _value.wikiPath
          : wikiPath // ignore: cast_nullable_to_non_nullable
              as String,
      quantities: null == quantities
          ? _value.quantities
          : quantities // ignore: cast_nullable_to_non_nullable
              as List<Quantity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FishImplCopyWith<$Res> implements $FishCopyWith<$Res> {
  factory _$$FishImplCopyWith(
          _$FishImpl value, $Res Function(_$FishImpl) then) =
      __$$FishImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String localPath,
      String wikiPath,
      List<Quantity> quantities});
}

/// @nodoc
class __$$FishImplCopyWithImpl<$Res>
    extends _$FishCopyWithImpl<$Res, _$FishImpl>
    implements _$$FishImplCopyWith<$Res> {
  __$$FishImplCopyWithImpl(_$FishImpl _value, $Res Function(_$FishImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? localPath = null,
    Object? wikiPath = null,
    Object? quantities = null,
  }) {
    return _then(_$FishImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      wikiPath: null == wikiPath
          ? _value.wikiPath
          : wikiPath // ignore: cast_nullable_to_non_nullable
              as String,
      quantities: null == quantities
          ? _value._quantities
          : quantities // ignore: cast_nullable_to_non_nullable
              as List<Quantity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FishImpl extends _Fish {
  _$FishImpl(
      {required this.name,
      required this.localPath,
      required this.wikiPath,
      required final List<Quantity> quantities})
      : _quantities = quantities,
        super._();

  factory _$FishImpl.fromJson(Map<String, dynamic> json) =>
      _$$FishImplFromJson(json);

  @override
  final String name;
  @override
  final String localPath;
  @override
  final String wikiPath;
  final List<Quantity> _quantities;
  @override
  List<Quantity> get quantities {
    if (_quantities is EqualUnmodifiableListView) return _quantities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quantities);
  }

  @override
  String toString() {
    return 'Fish(name: $name, localPath: $localPath, wikiPath: $wikiPath, quantities: $quantities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FishImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.wikiPath, wikiPath) ||
                other.wikiPath == wikiPath) &&
            const DeepCollectionEquality()
                .equals(other._quantities, _quantities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, localPath, wikiPath,
      const DeepCollectionEquality().hash(_quantities));

  /// Create a copy of Fish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FishImplCopyWith<_$FishImpl> get copyWith =>
      __$$FishImplCopyWithImpl<_$FishImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FishImplToJson(
      this,
    );
  }
}

abstract class _Fish extends Fish {
  factory _Fish(
      {required final String name,
      required final String localPath,
      required final String wikiPath,
      required final List<Quantity> quantities}) = _$FishImpl;
  _Fish._() : super._();

  factory _Fish.fromJson(Map<String, dynamic> json) = _$FishImpl.fromJson;

  @override
  String get name;
  @override
  String get localPath;
  @override
  String get wikiPath;
  @override
  List<Quantity> get quantities;

  /// Create a copy of Fish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FishImplCopyWith<_$FishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
