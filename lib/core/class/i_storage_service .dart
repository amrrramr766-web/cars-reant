abstract class IStorageService {
  Future<int?> getUserId();
  Future<void> setUserId(int userId);
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);
  Future<void> clear();
}
