// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  @JsonKey(name: 'bookingID')
  int? get id => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  @BookingStatusConverter()
  BookingStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'userID')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'carID')
  int? get carId =>
      throw _privateConstructorUsedError; // Joined/extended fields that may come from the backend
  String? get fullName => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingID') int? id,
      String? startDate,
      String? endDate,
      double? totalPrice,
      @BookingStatusConverter() BookingStatus? status,
      @JsonKey(name: 'userID') int? userId,
      @JsonKey(name: 'carID') int? carId,
      String? fullName,
      String? brand,
      String? model,
      String? year});
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalPrice = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? carId = freezed,
    Object? fullName = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? year = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
          _$BookingModelImpl value, $Res Function(_$BookingModelImpl) then) =
      __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingID') int? id,
      String? startDate,
      String? endDate,
      double? totalPrice,
      @BookingStatusConverter() BookingStatus? status,
      @JsonKey(name: 'userID') int? userId,
      @JsonKey(name: 'carID') int? carId,
      String? fullName,
      String? brand,
      String? model,
      String? year});
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
      _$BookingModelImpl _value, $Res Function(_$BookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalPrice = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? carId = freezed,
    Object? fullName = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? year = freezed,
  }) {
    return _then(_$BookingModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl extends _BookingModel {
  const _$BookingModelImpl(
      {@JsonKey(name: 'bookingID') this.id,
      this.startDate,
      this.endDate,
      this.totalPrice,
      @BookingStatusConverter() this.status,
      @JsonKey(name: 'userID') this.userId,
      @JsonKey(name: 'carID') this.carId,
      this.fullName,
      this.brand,
      this.model,
      this.year})
      : super._();

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  @JsonKey(name: 'bookingID')
  final int? id;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final double? totalPrice;
  @override
  @BookingStatusConverter()
  final BookingStatus? status;
  @override
  @JsonKey(name: 'userID')
  final int? userId;
  @override
  @JsonKey(name: 'carID')
  final int? carId;
// Joined/extended fields that may come from the backend
  @override
  final String? fullName;
  @override
  final String? brand;
  @override
  final String? model;
  @override
  final String? year;

  @override
  String toString() {
    return 'BookingModel(id: $id, startDate: $startDate, endDate: $endDate, totalPrice: $totalPrice, status: $status, userId: $userId, carId: $carId, fullName: $fullName, brand: $brand, model: $model, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate,
      totalPrice, status, userId, carId, fullName, brand, model, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(
      this,
    );
  }
}

abstract class _BookingModel extends BookingModel {
  const factory _BookingModel(
      {@JsonKey(name: 'bookingID') final int? id,
      final String? startDate,
      final String? endDate,
      final double? totalPrice,
      @BookingStatusConverter() final BookingStatus? status,
      @JsonKey(name: 'userID') final int? userId,
      @JsonKey(name: 'carID') final int? carId,
      final String? fullName,
      final String? brand,
      final String? model,
      final String? year}) = _$BookingModelImpl;
  const _BookingModel._() : super._();

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  @JsonKey(name: 'bookingID')
  int? get id;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  double? get totalPrice;
  @override
  @BookingStatusConverter()
  BookingStatus? get status;
  @override
  @JsonKey(name: 'userID')
  int? get userId;
  @override
  @JsonKey(name: 'carID')
  int? get carId;
  @override // Joined/extended fields that may come from the backend
  String? get fullName;
  @override
  String? get brand;
  @override
  String? get model;
  @override
  String? get year;
  @override
  @JsonKey(ignore: true)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
