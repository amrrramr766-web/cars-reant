import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSource {
  final Crud crud;

  AuthRemoteDataSource(this.crud);

  Future<Either<StatusRequest, dynamic>> registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    return await crud.postData(LinkApi.register, {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    });
  }

  Future<Either<StatusRequest, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    return await crud.postData(LinkApi.login, {
      "email": email,
      "password": password,
    });
  }
}
