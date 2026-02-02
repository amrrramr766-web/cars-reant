import 'package:dio/dio.dart';
import '../../Data Layer/Local Data Sources/auth_local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource authLocalDataSource;

  AuthInterceptor(this.authLocalDataSource);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // جلب التوكن من الـ SharedPreferences التي أعددتها للتو
    final token = authLocalDataSource.getToken();

    if (token != null && token.isNotEmpty) {
      // إضافة التوكن بصيغة Bearer Token المتعارف عليها في JWT
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // إذا انتهت صلاحية التوكن (401)، يمكنك هنا توجيه المستخدم لتسجيل الدخول
    if (err.response?.statusCode == 401) {
      print("Token expired or unauthorized!");
    }
    super.onError(err, handler);
  }
}
