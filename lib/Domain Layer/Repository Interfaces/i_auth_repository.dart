// lib/domain/repositories/i_auth_repository.dart
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  /// Logs in a user with email and password
  /// Returns [User] on success or [Failure] on error
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  /// Registers a new user
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  });

  /// Logs out the current user
  Future<Either<Failure, void>> logout();

  /// Gets the currently logged-in user
  Future<Either<Failure, UserModel>> getCurrentUser();

  /// Checks if user is logged in
  Future<bool> isLoggedIn();
}
