import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class UserData {
  Crud crud;
  UserData(this.crud);
  // Fetch user info by ID
  Future<Either<StatusRequest, dynamic>> fetchUserInfo(int id) async {
    final response = await crud.getData('${LinkApi.userLicense}$id/license');
    print("UserData fetchUserInfo response: $response"); // Debug print
    print("'${LinkApi.userinfo}$id'"); // Debug print

    return response;
  }
}
