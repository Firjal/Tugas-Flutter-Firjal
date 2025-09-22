import 'package:tostore/tostore.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;

  AppDatabase._internal();

  final _store = ToStore();

  Future<void> saveUser(String email, String password) async {
    await _store.setValue("users_$email", {
      "email": email,
      "password": password,
    });
  }

  Future<Map<String, dynamic>?> getUser(String email) async {
    final data = await _store.getValue("users_$email");
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }
}
