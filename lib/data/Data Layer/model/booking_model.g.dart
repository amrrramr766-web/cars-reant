// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: (json['bookingID'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      status: _$JsonConverterFromJson<String, BookingStatus>(
          json['status'], const BookingStatusConverter().fromJson),
      userId: (json['userID'] as num?)?.toInt(),
      carId: (json['carID'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      year: json['year'] as String?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'bookingID': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalPrice': instance.totalPrice,
      'status': _$JsonConverterToJson<String, BookingStatus>(
          instance.status, const BookingStatusConverter().toJson),
      'userID': instance.userId,
      'carID': instance.carId,
      'fullName': instance.fullName,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
