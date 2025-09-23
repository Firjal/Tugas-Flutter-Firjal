import 'package:latihan_flutter_firjal/services/storage_service.dart';

import '../models/user.dart';

class AuthService {
  final StorageService _storage = StorageService();

  Future<bool> register(String username, String email, String password) async {
    // Simulasi penyimpanan user (harusnya lewat API)
    final user = UserModel(username: username, email: email);
    await _storage.saveData("user", user.toJson());
    await _storage.saveData("password", password);
    return true;
  }

  Future<UserModel?> login(String email, String password) async {
    final storedUser = await _storage.getData("user");
    final storedPass = await _storage.getData("password");

    if (storedUser != null && storedPass == password) {
      if (storedUser["email"] == email) {
        return UserModel.fromJson(storedUser);
      }
    }
    return null;
  }

  Future<void> logout() async {
    await _storage.removeData("user");
    await _storage.removeData("password");
  }
}
