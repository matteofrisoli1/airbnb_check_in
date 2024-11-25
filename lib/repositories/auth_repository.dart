import 'dart:async';

import 'package:airbnb_checkin/models/auth_status.dart';
import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:airbnb_checkin/services/auth_service.dart';
import 'package:airbnb_checkin/services/keychain_service.dart';

class AuthRepository {
  final AuthService authService;
  final KeychainService keychainService;

  final StreamController<AuthStatus> _controller = StreamController();

  AuthRepository({
    required this.authService,
    required this.keychainService,
  });

  // Steam getter
  Stream<AuthStatus> get currentStatus async* {
    MyUser? user;

    try {
      user = await keychainService.user;
    } catch (_) {}

    if (user != null) {
      yield AuthenticatedAuthStatus(user: user);
    } else {
      yield const NotAuthenticatedAuthStatus();
    }

    yield* _controller.stream.asBroadcastStream().distinct();
  }

  // Metodo per SignIn
  Future<void> signIn(String email, String password) async {
    final user = await authService.search(email, password);

    if (user != null) {
      await keychainService.saveUser(user);

      _controller.add(AuthenticatedAuthStatus(user: user));
    } else {
      throw Exception('Invalid credentials');
    }
  }

  // Metoto per SignOut
  Future<void> signOut() async {
    await keychainService.deleteUser();
    _controller.add(const NotAuthenticatedAuthStatus());
  }
}
