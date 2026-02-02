import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/Data%20Layer/model/login_requst.dart';
import 'package:car_rent/Data%20Layer/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final AuthLocalDataSource _authLocalDataSource;

  LoginCubit(this._authRepository, this._authLocalDataSource)
    : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    if (request.email.trim().isEmpty || request.password.trim().isEmpty) {
      emit(LoginFailure("البريد الإلكتروني وكلمة المرور مطلوبة"));
      return;
    }

    emit(LoginLoading());

    final result = await _authRepository.login(
      email: request.email.trim(),
      password: request.password.trim(),
    );

    result.fold(
      (failure) {
        emit(LoginFailure(_mapFailureToMessage(failure)));
      },
      (user) async {
        await _authLocalDataSource.cacheUser(user);
        await _authLocalDataSource.setUserID(user.userID);
        emit(LoginSuccess(user.userID, user.fullName, user.email));
      },
    );
  }

  String _mapFailureToMessage(Object failure) {
    return "فشل تسجيل الدخول. تحقق من البيانات.";
  }
}
