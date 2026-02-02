// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LicenseModel _$LicenseModelFromJson(Map<String, dynamic> json) {
  return _LicenseModel.fromJson(json);
}

/// @nodoc
mixin _$LicenseModel {
  int get id => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_date')
  String? get expiryDate => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LicenseModelCopyWith<LicenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseModelCopyWith<$Res> {
  factory $LicenseModelCopyWith(
          LicenseModel value, $Res Function(LicenseModel) then) =
      _$LicenseModelCopyWithImpl<$Res, LicenseModel>;
  @useResult
  $Res call(
      {int id,
      String licenseNumber,
      @JsonKey(name: 'exp_date') String? expiryDate,
      String address});
}

/// @nodoc
class _$LicenseModelCopyWithImpl<$Res, $Val extends LicenseModel>
    implements $LicenseModelCopyWith<$Res> {
  _$LicenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? licenseNumber = null,
    Object? expiryDate = freezed,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicenseModelImplCopyWith<$Res>
    implements $LicenseModelCopyWith<$Res> {
  factory _$$LicenseModelImplCopyWith(
          _$LicenseModelImpl value, $Res Function(_$LicenseModelImpl) then) =
      __$$LicenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String licenseNumber,
      @JsonKey(name: 'exp_date') String? expiryDate,
      String address});
}

/// @nodoc
class __$$LicenseModelImplCopyWithImpl<$Res>
    extends _$LicenseModelCopyWithImpl<$Res, _$LicenseModelImpl>
    implements _$$LicenseModelImplCopyWith<$Res> {
  __$$LicenseModelImplCopyWithImpl(
      _$LicenseModelImpl _value, $Res Function(_$LicenseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? licenseNumber = null,
    Object? expiryDate = freezed,
    Object? address = null,
  }) {
    return _then(_$LicenseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LicenseModelImpl extends _LicenseModel {
  const _$LicenseModelImpl(
      {required this.id,
      required this.licenseNumber,
      @JsonKey(name: 'exp_date') required this.expiryDate,
      required this.address})
      : super._();

  factory _$LicenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicenseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String licenseNumber;
  @override
  @JsonKey(name: 'exp_date')
  final String? expiryDate;
  @override
  final String address;

  @override
  String toString() {
    return 'LicenseModel(id: $id, licenseNumber: $licenseNumber, expiryDate: $expiryDate, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, licenseNumber, expiryDate, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseModelImplCopyWith<_$LicenseModelImpl> get copyWith =>
      __$$LicenseModelImplCopyWithImpl<_$LicenseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseModelImplToJson(
      this,
    );
  }
}

abstract class _LicenseModel extends LicenseModel {
  const factory _LicenseModel(
      {required final int id,
      required final String licenseNumber,
      @JsonKey(name: 'exp_date') required final String? expiryDate,
      required final String address}) = _$LicenseModelImpl;
  const _LicenseModel._() : super._();

  factory _LicenseModel.fromJson(Map<String, dynamic> json) =
      _$LicenseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get licenseNumber;
  @override
  @JsonKey(name: 'exp_date')
  String? get expiryDate;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$LicenseModelImplCopyWith<_$LicenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
