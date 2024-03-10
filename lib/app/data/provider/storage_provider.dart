import 'package:get_storage/get_storage.dart';

class StorageProvider {
  static Future<void> write(String key, String value) async {
    await GetStorage().write(key, value);
  }

  static String read(String key) {
    try {
      return GetStorage().read(key) ?? "";
    } catch (e) {
      // Handle the error, log it, or return a default value
      return "";
    }
  }

  static void clearAll() {
    GetStorage().erase();
  }
}

class StorageKey {
  static const String status = "status";
  static const String idUser = "idUser";
}

