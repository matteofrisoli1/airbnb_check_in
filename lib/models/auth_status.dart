import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:equatable/equatable.dart';

sealed class AuthStatus extends Equatable {
  const AuthStatus();

  @override
  List<Object?> get props => [];
}

final class AuthenticatedAuthStatus extends AuthStatus {
  final MyUser user;

  const AuthenticatedAuthStatus({required this.user});

  @override
  List<Object?> get props => [user];
}

final class NotAuthenticatedAuthStatus extends AuthStatus {
  const NotAuthenticatedAuthStatus();
}
