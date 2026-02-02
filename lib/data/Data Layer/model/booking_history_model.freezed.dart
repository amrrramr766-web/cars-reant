// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingHistoryModel _$BookingHistoryModelFromJson(Map<String, dynamic> json) {
  return _BookingHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$BookingHistoryModel {
  @JsonKey(name: 'bookingID')
  int? get bookingID => throw _privateConstructorUsedError;
  @JsonKey(name: 'userID')
  int? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'carID')
  int? get carID => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError; // Joined fields
  String? get fullName => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingHistoryModelCopyWith<BookingHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingHistoryModelCopyWith<$Res> {
  factory $BookingHistoryModelCopyWith(
          BookingHistoryModel value, $Res Function(BookingHistoryModel) then) =
      _$BookingHistoryModelCopyWithImpl<$Res, BookingHistoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingID') int? bookingID,
      @JsonKey(name: 'userID') int? userID,
      @JsonKey(name: 'carID') int? carID,
      double? totalPrice,
      String? status,
      String? startDate,
      String? endDate,
      String? createdAt,
      String? fullName,
      String? brand,
      String? model,
      String? year});
}

/// @nodoc
class _$BookingHistoryModelCopyWithImpl<$Res, $Val extends BookingHistoryModel>
    implements $BookingHistoryModelCopyWith<$Res> {
  _$BookingHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingID = freezed,
    Object? userID = freezed,
    Object? carID = freezed,
    Object? totalPrice = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdAt = freezed,
    Object? fullName = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? year = freezed,
  }) {
    return _then(_value.copyWith(
      bookingID: freezed == bookingID
          ? _value.bookingID
          : bookingID // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int?,
      carID: freezed == carID
          ? _value.carID
          : carID // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$BookingHistoryModelImplCopyWith<$Res>
    implements $BookingHistoryModelCopyWith<$Res> {
  factory _$$BookingHistoryModelImplCopyWith(_$BookingHistoryModelImpl value,
          $Res Function(_$BookingHistoryModelImpl) then) =
      __$$BookingHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingID') int? bookingID,
      @JsonKey(name: 'userID') int? userID,
      @JsonKey(name: 'carID') int? carID,
      double? totalPrice,
      String? status,
      String? startDate,
      String? endDate,
      String? createdAt,
      String? fullName,
      String? brand,
      String? model,
      String? year});
}

/// @nodoc
class __$$BookingHistoryModelImplCopyWithImpl<$Res>
    extends _$BookingHistoryModelCopyWithImpl<$Res, _$BookingHistoryModelImpl>
    implements _$$BookingHistoryModelImplCopyWith<$Res> {
  __$$BookingHistoryModelImplCopyWithImpl(_$BookingHistoryModelImpl _value,
      $Res Function(_$BookingHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingID = freezed,
    Object? userID = freezed,
    Object? carID = freezed,
    Object? totalPrice = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createdAt = freezed,
    Object? fullName = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? year = freezed,
  }) {
    return _then(_$BookingHistoryModelImpl(
      bookingID: freezed == bookingID
          ? _value.bookingID
          : bookingID // ignore: cast_nullable_to_non_nullable
              as int?,
      userID: freezed == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int?,
      carID: freezed == carID
          ? _value.carID
          : carID // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$BookingHistoryModelImpl implements _BookingHistoryModel {
  const _$BookingHistoryModelImpl(
      {@JsonKey(name: 'bookingID') this.bookingID,
      @JsonKey(name: 'userID') this.userID,
      @JsonKey(name: 'carID') this.carID,
      this.totalPrice,
      this.status,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.fullName,
      this.brand,
      this.model,
      this.year});

  factory _$BookingHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingHistoryModelImplFromJson(json);

  @override
  @JsonKey(name: 'bookingID')
  final int? bookingID;
  @override
  @JsonKey(name: 'userID')
  final int? userID;
  @override
  @JsonKey(name: 'carID')
  final int? carID;
  @override
  final double? totalPrice;
  @override
  final String? status;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final String? createdAt;
// Joined fields
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
    return 'BookingHistoryModel(bookingID: $bookingID, userID: $userID, carID: $carID, totalPrice: $totalPrice, status: $status, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, fullName: $fullName, brand: $brand, model: $model, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingHistoryModelImpl &&
            (identical(other.bookingID, bookingID) ||
                other.bookingID == bookingID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.carID, carID) || other.carID == carID) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingID,
      userID,
      carID,
      totalPrice,
      status,
      startDate,
      endDate,
      createdAt,
      fullName,
      brand,
      model,
      year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingHistoryModelImplCopyWith<_$BookingHistoryModelImpl> get copyWith =>
      __$$BookingHistoryModelImplCopyWithImpl<_$BookingHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _BookingHistoryModel implements BookingHistoryModel {
  const factory _BookingHistoryModel(
      {@JsonKey(name: 'bookingID') final int? bookingID,
      @JsonKey(name: 'userID') final int? userID,
      @JsonKey(name: 'carID') final int? carID,
      final double? totalPrice,
      final String? status,
      final String? startDate,
      final String? endDate,
      final String? createdAt,
      final String? fullName,
      final String? brand,
      final String? model,
      final String? year}) = _$BookingHistoryModelImpl;

  factory _BookingHistoryModel.fromJson(Map<String, dynamic> json) =
      _$BookingHistoryModelImpl.fromJson;

  @override
  @JsonKey(name: 'bookingID')
  int? get bookingID;
  @override
  @JsonKey(name: 'userID')
  int? get userID;
  @override
  @JsonKey(name: 'carID')
  int? get carID;
  @override
  double? get totalPrice;
  @override
  String? get status;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String? get createdAt;
  @override // Joined fields
  String? get fullName;
  @override
  String? get brand;
  @override
  String? get model;
  @override
  String? get year;
  @override
  @JsonKey(ignore: true)
  _$$BookingHistoryModelImplCopyWith<_$BookingHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
