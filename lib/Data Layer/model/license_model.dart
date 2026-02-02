import 'package:car_rent/Domain%20Layer/Entities/license_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_model.freezed.dart';
part 'license_model.g.dart';

@freezed
class LicenseModel with _$LicenseModel {
  const LicenseModel._(); // مهم جداً

  const factory LicenseModel({
    required int id,
    required String licenseNumber,
    @JsonKey(name: 'exp_date') required String? expiryDate,
    required String address,
  }) = _LicenseModel;

  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);

  LicenseEntity toEntity() {
    return LicenseEntity(
      id: id,
      licenseNumber: licenseNumber,
      expiryDate: DateTime.tryParse(expiryDate ?? '') ?? DateTime(1970),
      address: address,
    );
  }
}
