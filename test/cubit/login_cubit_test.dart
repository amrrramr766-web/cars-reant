import 'package:bloc_test/bloc_test.dart';
import 'package:car_rent/controller/auth/login/cubit/login_cubit.dart';
import 'package:car_rent/data/data_source/remote/auth/login.dart';
import 'package:car_rent/data/model/login_requst.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock class for LoginData
class MockLoginData extends Mock implements LoginData {}

void main() {
  late MockLoginData mockLoginData;
  late LoginCubit loginCubit;

  // Sample test data
  final testLoginRequest = LoginRequst(
    email: "test@example.com",
    password: "password123",
  );

  final testUserData = {
    "userID": 1,
    "name": "Test User",
    "email": "test@example.com",
  };

  setUpAll(() {
    // Register fallback values for any() matchers
    registerFallbackValue(testLoginRequest);
  });

  setUp(() async {
    // Initialize SharedPreferences with mock data
    SharedPreferences.setMockInitialValues({});

    mockLoginData = MockLoginData();
    loginCubit = LoginCubit(mockLoginData);
  });

  tearDown(() {
    loginCubit.close();
  });

  group('LoginCubit', () {
    test('initial state is LoginInitial', () {
      expect(loginCubit.state, equals(LoginInitial()));
    });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginLoading, LoginSuccess] when login succeeds',
      build: () {
        when(
          () => mockLoginData.postdata(any(), any()),
        ).thenAnswer((_) async => Right(testUserData));
        return loginCubit;
      },
      act: (cubit) => cubit.login(testLoginRequest),
      expect: () => [
        LoginLoading(),
        LoginSuccess(1, "Test User", "test@example.com"),
      ],
      verify: (_) {
        verify(
          () => mockLoginData.postdata(
            testLoginRequest.email.trim(),
            testLoginRequest.password.trim(),
          ),
        ).called(1);
      },
    );

    blocTest<LoginCubit, LoginState>(
      'emits LoginFailure when email or password is empty',
      build: () => loginCubit,
      act: (cubit) => cubit.login(LoginRequst(email: "", password: "")),
      expect: () => [
        LoginFailure("البريد الإلكتروني وكلمة المرور لا يمكن أن تكون فارغة"),
      ],
      verify: (_) {
        // Verify that API was NOT called
        verifyNever(() => mockLoginData.postdata(any(), any()));
      },
    );

    blocTest<LoginCubit, LoginState>(
      'loadUserFromPrefs emits LoginSuccess when user data exists',
      setUp: () async {
        SharedPreferences.setMockInitialValues({
          "userID": 1,
          "name": "Test User",
          "email": "test@example.com",
        });
      },
      build: () => loginCubit,
      act: (cubit) => cubit.loadUserFromPrefs(),
      expect: () => [LoginSuccess(1, "Test User", "test@example.com")],
    );

    blocTest<LoginCubit, LoginState>(
      'logout clears SharedPreferences and emits LoginInitial',
      setUp: () async {
        SharedPreferences.setMockInitialValues({
          "userID": 1,
          "name": "Test User",
          "email": "test@example.com",
        });
      },
      build: () => loginCubit,
      act: (cubit) => cubit.logout(),
      expect: () => [LoginInitial()],
      verify: (_) async {
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt("userID"), isNull);
        expect(prefs.getString("name"), isNull);
        expect(prefs.getString("email"), isNull);
      },
    );
  });
}
