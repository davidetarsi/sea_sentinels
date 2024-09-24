// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fish_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FishItem _$FishItemFromJson(Map<String, dynamic> json) {
  return _FishItem.fromJson(json);
}

/// @nodoc
mixin _$FishItem {
  Fish get fish => throw _privateConstructorUsedError;
  Quantity get quantity => throw _privateConstructorUsedError;

  /// Serializes this FishItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FishItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FishItemCopyWith<FishItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FishItemCopyWith<$Res> {
  factory $FishItemCopyWith(FishItem value, $Res Function(FishItem) then) =
      _$FishItemCopyWithImpl<$Res, FishItem>;
  @useResult
  $Res call({Fish fish, Quantity quantity});

  $FishCopyWith<$Res> get fish;
}

/// @nodoc
class _$FishItemCopyWithImpl<$Res, $Val extends FishItem>
    implements $FishItemCopyWith<$Res> {
  _$FishItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FishItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fish = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      fish: null == fish
          ? _value.fish
          : fish // ignore: cast_nullable_to_non_nullable
              as Fish,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity,
    ) as $Val);
  }

  /// Create a copy of FishItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FishCopyWith<$Res> get fish {
    return $FishCopyWith<$Res>(_value.fish, (value) {
      return _then(_value.copyWith(fish: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FishItemImplCopyWith<$Res>
    implements $FishItemCopyWith<$Res> {
  factory _$$FishItemImplCopyWith(
          _$FishItemImpl value, $Res Function(_$FishItemImpl) then) =
      __$$FishItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fish fish, Quantity quantity});

  @override
  $FishCopyWith<$Res> get fish;
}

/// @nodoc
class __$$FishItemImplCopyWithImpl<$Res>
    extends _$FishItemCopyWithImpl<$Res, _$FishItemImpl>
    implements _$$FishItemImplCopyWith<$Res> {
  __$$FishItemImplCopyWithImpl(
      _$FishItemImpl _value, $Res Function(_$FishItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FishItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fish = null,
    Object? quantity = null,
  }) {
    return _then(_$FishItemImpl(
      fish: null == fish
          ? _value.fish
          : fish // ignore: cast_nullable_to_non_nullable
              as Fish,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Quantity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FishItemImpl extends _FishItem {
  _$FishItemImpl({required this.fish, required this.quantity}) : super._();

  factory _$FishItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FishItemImplFromJson(json);

  @override
  final Fish fish;
  @override
  final Quantity quantity;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FishItemImpl &&
            (identical(other.fish, fish) || other.fish == fish) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fish, quantity);

  /// Create a copy of FishItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FishItemImplCopyWith<_$FishItemImpl> get copyWith =>
      __$$FishItemImplCopyWithImpl<_$FishItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FishItemImplToJson(
      this,
    );
  }
}

abstract class _FishItem extends FishItem {
  factory _FishItem(
      {required final Fish fish,
      required final Quantity quantity}) = _$FishItemImpl;
  _FishItem._() : super._();

  factory _FishItem.fromJson(Map<String, dynamic> json) =
      _$FishItemImpl.fromJson;

  @override
  Fish get fish;
  @override
  Quantity get quantity;

  /// Create a copy of FishItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FishItemImplCopyWith<_$FishItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
