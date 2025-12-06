import 'package:car_rent/data/data_source/remote/auth/login.dart';
import 'package:car_rent/data/model/login_requst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginData loginData;

  LoginCubit(this.loginData) : super(LoginInitial());

  /// تسجيل الدخول
  Future<void> login(LoginRequst loginRequest) async {
    print('🔐 [LoginCubit] login() called with email: ${loginRequest.email}');
    if (loginRequest.email.isEmpty || loginRequest.password.isEmpty) {
      print('❌ [LoginCubit] Empty email or password');
      if (!isClosed) {
        emit(
          LoginFailure("البريد الإلكتروني وكلمة المرور لا يمكن أن تكون فارغة"),
        );
      }
      return;
    }

    print('⏳ [LoginCubit] Emitting LoginLoading state');
    if (!isClosed) emit(LoginLoading());

    try {
      print('🌐 [LoginCubit] Sending login request to backend...');
      final response = await loginData.postdata(
        loginRequest.email.trim(),
        loginRequest.password.trim(),
      );
      print('📡 [LoginCubit] Response received');

      response.fold(
        (status) {
          print('❌ [LoginCubit] Login failed with status: $status');
          if (!isClosed) emit(LoginFailure(status.toString()));
        },
        (data) async {
          print('✅ [LoginCubit] Login successful, data: $data');
          if (!isClosed) {
            if (data["userID"] != null) {
              print('💾 [LoginCubit] Saving user data to SharedPreferences');
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt("userID", data["userID"]);
              await prefs.setString("name", data["fullName"] ?? ""); // <-- use fullName
              await prefs.setString("email", data["email"] ?? "");
              await prefs.setString("step", "2");
              print('✅ [LoginCubit] User data saved successfully');
              emit(LoginSuccess(data["userID"], data["fullName"] ?? "", data["email"] ?? ""));
            }
            else {
              print('❌ [LoginCubit] Invalid response: userID is null');
              emit(LoginFailure("الاستجابة من الخادم غير صالحة"));
            }
          }
        },
      );
    } catch (e) {
      print('💥 [LoginCubit] Exception occurred: $e');
      if (!isClosed) emit(LoginFailure("حدث خطأ غير متوقع: $e"));
    }
  }

  /// تحميل بيانات المستخدم من SharedPreferences
  Future<void> loadUserFromPrefs() async {
    print('📂 [LoginCubit] loadUserFromPrefs() called');
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt("userID");
    final name = prefs.getString("name");
    final email = prefs.getString("email");

    if (userId != null && name != null && email != null) {
      print('✅ [LoginCubit] User found in prefs: $name ($email)');
      if (!isClosed) emit(LoginSuccess(userId, name, email));
    } else {
      print('❌ [LoginCubit] No user data in prefs');
      if (!isClosed) emit(LoginInitial());
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    print('🚪 [LoginCubit] logout() called');
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('✅ [LoginCubit] SharedPreferences cleared');
    if (!isClosed) emit(LoginInitial());
  }
}
