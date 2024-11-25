part of 'dependency_injector.dart';

List<SingleChildWidget> _providers = [
  Provider<AuthService>(
    create: (_) => AuthService(),
  ),
  Provider<KeychainService>(
    create: (_) => KeychainService(
      secureStorage: const FlutterSecureStorage(),
    ),
  ),
];
