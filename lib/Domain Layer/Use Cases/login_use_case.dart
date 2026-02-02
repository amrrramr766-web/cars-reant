// lib/domain/usecases/auth/login_use_case.dart
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_auth_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';
import 'package:car_rent/data/Data%20Layer/model/user_model.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(String email, String password) async {
    // Business logic validation
    if (email.isEmpty || password.isEmpty) {
      return Left(ValidationFailure('Email and password required'));
    }

    // Delegate to repository
    return await repository.login(email: email, password: password);
  }
}
