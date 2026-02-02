import 'package:car_rent/Data%20Layer/model/license_model.dart';
import 'package:car_rent/Domain%20Layer/Entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  // إضافة الكونستركتور الخاص للسماح بالـ Methods
  const UserModel._();

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

  // تحويل الموديل إلى Entity للتعامل معه في الـ UI/Domain
  UserEntity toEntity() {
    return UserEntity(
      id: userID,
      fullName: fullName,
      email: email,
      phone: phone,
      role: UserRole.fromInt(role),
      isActive: isActive,
      createdAt: DateTime.parse(createdAt), // تحويل النص إلى DateTime
      license: license?.toEntity(), // استدعاء toEntity من موديل الرخصة
    );
  }
}

// الدوال المساعدة (تأكد أنها خارج الكلاس أو static)
LicenseModel _licenseFromJson(dynamic json) {
  if (json == null || (json is List && json.isEmpty)) {
    return const LicenseModel(
      id: 0,
      licenseNumber: '',
      expiryDate: null,
      address: '',
    );
  }
  final Map<String, dynamic> map = json is List
      ? Map<String, dynamic>.from(json.first)
      : Map<String, dynamic>.from(json);

  return LicenseModel.fromJson(map);
}

Map<String, dynamic>? _licenseToJson(LicenseModel? license) =>
    license?.toJson();
