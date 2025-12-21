import 'package:car_rent/Domain%20Layer/Entities/license_entity.dart';
import 'package:car_rent/data/Data%20Layer/model/license_model.dart';

extension LicenseModelMapper on LicenseModel {
  LicenseEntity toEntity() {
    return LicenseEntity(
      id: id!,
      licenseNumber: licenseNumber!,
      expiryDate: expiryDate,
      address: address!,
    );
  }
}
