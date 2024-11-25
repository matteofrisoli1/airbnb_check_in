import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_user.g.dart';

@JsonSerializable()
final class MyUser extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String? imageUrl;

  const MyUser({
    required this.fullName,
    required this.email,
    required this.password,
    this.imageUrl,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

  Map<String, dynamic> toJson() => _$MyUserToJson(this);

  @override
  List<Object?> get props => [fullName, email, password];
}
