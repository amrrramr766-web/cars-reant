// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingHistoryModelImpl _$$BookingHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingHistoryModelImpl(
      bookingID: (json['bookingID'] as num?)?.toInt(),
      userID: (json['userID'] as num?)?.toInt(),
      carID: (json['carID'] as num?)?.toInt(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      status: json['status'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      createdAt: json['createdAt'] as String?,
      fullName: json['fullName'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      year: json['year'] as String?,
    );

Map<String, dynamic> _$$BookingHistoryModelImplToJson(
        _$BookingHistoryModelImpl instance) =>
    <String, dynamic>{
      'bookingID': instance.bookingID,
      'userID': instance.userID,
      'carID': instance.carID,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'createdAt': instance.createdAt,
      'fullName': instance.fullName,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
    };
