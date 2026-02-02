// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarModelImpl _$$CarModelImplFromJson(Map<String, dynamic> json) =>
    _$CarModelImpl(
      carID: (json['carID'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      year: json['year'] as String?,
      imageUrl: json['imageUrl'] as String?,
      plateNumber: json['plateNumber'] as String?,
      gear: json['gear'] as String?,
      gas: json['gas'] as String?,
      pricePerDay: (json['pricePerDay'] as num?)?.toDouble(),
      seat: (json['seat'] as num?)?.toInt(),
      isAvailable: json['isAvailable'] as bool?,
      isFave: json['isFave'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$CarModelImplToJson(_$CarModelImpl instance) =>
    <String, dynamic>{
      'carID': instance.carID,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'imageUrl': instance.imageUrl,
      'plateNumber': instance.plateNumber,
      'gear': instance.gear,
      'gas': instance.gas,
      'pricePerDay': instance.pricePerDay,
      'seat': instance.seat,
      'isAvailable': instance.isAvailable,
      'isFave': instance.isFave,
      'createdAt': instance.createdAt,
    };
