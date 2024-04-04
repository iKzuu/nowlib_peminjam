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

  static Future<void> delete(String key) async {
    await GetStorage().remove(key);
  }


  static void clearAll() {
    GetStorage().erase();
  }
}

class StorageKey {
  static const String status = "status";
  static const String idUser = "idUser";
  static const String namalengkap = "namalengkap";
  static const String idBuku = "idBuku";
  static const String idPinjam = "idPinjam";
  static const String token = "token";
  static const String role = "role";
  static const String alamat = "alamat";
}

