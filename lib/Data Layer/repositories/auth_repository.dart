import 'package:car_rent/Domain%20Layer/Entities/user_entity.dart';
import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/auth_remote_data_source.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_auth_repository.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/user_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository implements IAuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository(this.remoteDataSource, this.authLocalDataSource);
  UserEntity? userModel;
  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      final user = await authLocalDataSource.getUser();
      return Right(user);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      await authLocalDataSource.getUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.loginUser(
        email: email,
        password: password,
      );

      return await response.fold(
        (failure) => Left(_mapStatusRequestToFailure(failure)),
        (data) async {
          final String? token = data['token'];
          if (token == null) {
            return const Left(ServerFailure('Token not found'));
          }

          // 1. حفظ التوكن لتفعيل الـ Interceptor
          await authLocalDataSource.saveToken(token);

          // 2. استخراج الـ ID من التوكن (JWT Decoding)
          // يمكنك استخدام مكتبة jwt_decoder أو استخراجه يدوياً
          // لنفترض أننا سنستخدم الـ ID الثابت حالياً أو دالة استخراج
          int userId = 10; // هذا الـ ID الذي ظهر في الـ Swagger الخاص بك

          // 3. جلب بيانات المستخدم الكاملة
          final userResponse = await remoteDataSource.getUserData(userId);

          return userResponse.fold(
            (failure) => Left(_mapStatusRequestToFailure(failure)),
            (userData) async {
              // الآن الـ userData تحتوي على الـ JSON الكامل الذي رأيته في Swagger
              final userModel = UserModel.fromJson(userData);

              // 4. تخزين البيانات الحقيقية في الكاش
              await authLocalDataSource.cacheUser(userModel);
              await authLocalDataSource.setUserID(userModel.userID);

              return Right(userModel);
            },
          );
        },
      );
    } catch (e) {
      return Left(ServerFailure('Login Flow Error: $e'));
    }
  }

  // Helper method to convert StatusRequest to Failure
  Failure _mapStatusRequestToFailure(StatusRequest status) {
    switch (status) {
      case StatusRequest.serverfailure:
        return const ServerFailure('Server error occurred');
      case StatusRequest.offlinefailure:
        return const CacheFailure('No internet connection');
      default:
        return const ServerFailure('An unknown error occurred');
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authLocalDataSource.clearUser();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      // استدعاء API مباشرة
      final response = await remoteDataSource.registerUser(
        email: email,
        phone: phone,
        name: name,
        password: password,
      );

      // unwrap Either type
      return response.fold(
        (failure) => Left(_mapStatusRequestToFailure(failure)),
        (data) async {
          if (data is Map<String, dynamic>) {
            final userModel = UserModel.fromJson(data);
            await authLocalDataSource.cacheUser(userModel);
            return Right(userModel);
          } else {
            return const Left(ServerFailure('Invalid response format'));
          }
        },
      );
    } catch (e) {
      return Left(ServerFailure('Failed to register: $e'));
    }
  }
}
