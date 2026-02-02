import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthLocalDataSource local;

  AuthCubit(this.local) : super(const AuthState.initial());

  Future<void> checkAuth() async {
    try {
      await local.getUser();
      emit(const AuthState.authenticated());
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> onLoginSuccess() async {
    emit(const AuthState.authenticated());
  }

  Future<void> logout() async {
    await local.clearUser();
    emit(const AuthState.unauthenticated());
  }
}
