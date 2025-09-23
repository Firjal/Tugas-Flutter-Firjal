import 'package:tostore/tostore.dart';

class StorageService {
  final _store = ToStore();

  Future<void> saveData(String key, dynamic value) async {
    await _store.setValue(key, value);
  }

  Future<dynamic> getData(String key) async {
    return await _store.getValue(key);
  }

  Future<void> removeData(String key) async {
    await _store.removeValue(key);
  }
}
