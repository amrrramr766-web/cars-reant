import 'package:car_rent/Domain%20Layer/Entities/user_entity.dart';
import 'package:car_rent/data/Data%20Layer/model/extension/license_model_mapper.dart';
import 'package:car_rent/data/Data%20Layer/model/user_model.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: userID,
      fullName: fullName,
      email: email,
      phone: phone,
      role: UserRole.fromInt(role),
      isActive: isActive,
      createdAt: DateTime.parse(createdAt),
      license: license?.toEntity(),
    );
  }
}
