import 'dart:convert';
import 'package:car_rent/data/Data%20Layer/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel> getUser();
  Future<void> clearUser();
  Future<void> setUserID(int userID);
  int? getUserID();

  Future<void> setStep(String step);
  String? getStep();
  Future<void> clearStep();
  Future<bool> isLoggedIn();
  Future<bool> hasSeenOnBoarding();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  static const _cachedUserKey = 'CACHED_USER';
  static const _stepKey = 'step';
  static const _userIDKey = 'userID';

  @override
  Future<void> cacheUser(UserModel user) async {
    await sharedPreferences.setString(
      _cachedUserKey,
      json.encode(user.toJson()),
    );
    // Persist userID as an integer for other parts of the app that read it directly
    await sharedPreferences.setInt(_userIDKey, user.userID);
  }

  @override
  Future<UserModel> getUser() async {
    final jsonString = sharedPreferences.getString(_cachedUserKey);

    if (jsonString == null) {
      throw Exception('No cached user found');
    }

    return UserModel.fromJson(json.decode(jsonString));
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(_cachedUserKey);
  }

  @override
  Future<void> setStep(String step) async {
    await sharedPreferences.setString(_stepKey, step);
  }

  @override
  Future<void> setUserID(int userID) async {
    await sharedPreferences.setInt(_userIDKey, userID);
  }

  @override
  int? getUserID() {
    return sharedPreferences.getInt(_userIDKey);
  }

  @override
  String? getStep() {
    return sharedPreferences.getString(_stepKey);
  }

  @override
  Future<void> clearStep() async {
    await sharedPreferences.remove(_stepKey);
  }

  @override
  Future<bool> hasSeenOnBoarding() {
    // TODO: implement hasSeenOnBoarding
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }
}
