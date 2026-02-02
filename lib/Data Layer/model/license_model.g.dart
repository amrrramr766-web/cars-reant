// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LicenseModelImpl _$$LicenseModelImplFromJson(Map<String, dynamic> json) =>
    _$LicenseModelImpl(
      id: (json['id'] as num).toInt(),
      licenseNumber: json['licenseNumber'] as String,
      expiryDate: json['exp_date'] as String?,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$LicenseModelImplToJson(_$LicenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licenseNumber': instance.licenseNumber,
      'exp_date': instance.expiryDate,
      'address': instance.address,
    };
