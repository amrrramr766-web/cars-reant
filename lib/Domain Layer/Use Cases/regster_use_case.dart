import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_auth_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';
import 'package:car_rent/Data%20Layer/model/user_model.dart';

class RegisterUseCase {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserModel>> call({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    // Business logic validation
    if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty) {
      return Left(ValidationFailure('All fields are required'));
    }

    // Delegate to repository
    return await repository.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
  }
}
