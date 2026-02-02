import 'package:car_rent/data/Data%20Layer/model/license_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int userID,
    required String fullName,
    required String email,
    required String phone,
    required int role,
    required bool isActive,
    required String createdAt,

    @JsonKey(
      name: 'licenses',
      fromJson: _licenseFromJson,
      toJson: _licenseToJson,
    )
    LicenseModel? license,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

LicenseModel _licenseFromJson(dynamic json) {
  if (json == null || (json is List && json.isEmpty)) {
    return LicenseModel(
      id: 0,
      licenseNumber: '',
      expiryDate: DateTime(1970),
      address: '',
    );
  }
  final Map<String, dynamic> map = json is List
      ? Map<String, dynamic>.from(json.first)
      : Map<String, dynamic>.from(json);
  return LicenseModel(
    id: map['id'] ?? 0,
    licenseNumber: map['licenseNumber'] ?? '',
    expiryDate: DateTime.parse(
      map['exp_date'] ?? map['expiryDate'] ?? DateTime(1970).toIso8601String(),
    ),
    address: map['address'] ?? '',
  );
}

Map<String, dynamic>? _licenseToJson(LicenseModel? license) {
  if (license == null) return null;
  return {
    'id': license.id,
    'licenseNumber': license.licenseNumber,
    'exp_date': license.expiryDate.toIso8601String(),
    'address': license.address,
  };
}
