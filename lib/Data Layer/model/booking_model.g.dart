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
      status: $enumDecodeNullable(_$BookingStatusEnumMap, json['status']),
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
      'status': _$BookingStatusEnumMap[instance.status],
      'userID': instance.userId,
      'carID': instance.carId,
      'fullName': instance.fullName,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.cancelled: 'cancelled',
};
