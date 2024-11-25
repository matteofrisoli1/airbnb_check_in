import 'dart:convert';

import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeychainService {
  static const _currentUser = 'currentUser';

  final FlutterSecureStorage secureStorage;

  KeychainService({required this.secureStorage});

  // Getter stream dell'utente
  Future<MyUser?> get user async {
    final raw = await secureStorage.read(key: _currentUser);
    if (raw == null) {
      return null;
    }

    return MyUser.fromJson(jsonDecode(raw));
  }

  // Metodo per memorizzare l'utente
  Future<void> saveUser(MyUser user) async {
    final raw = jsonEncode(user.toJson());
    await secureStorage.write(key: _currentUser, value: raw);
  }

  // Metodo per rimuovere l'utente
  Future<void> deleteUser() async {
    await secureStorage.delete(key: _currentUser);
  }
}
