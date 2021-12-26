import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String token;
  final String id;
  final String username;
  final String email;
  final List<String> roles;
  final String profileImageUrl;
  final String phoneNumber;
  final String countryCode;

  const UserEntity(
      {required this.token,
      required this.id,
      required this.username,
      required this.email,
      required this.roles,
      required this.profileImageUrl,
      required this.phoneNumber,
      required this.countryCode});

  @override
  // TODO: implement props
  List<Object?> get props => [token, id, username, email, roles, profileImageUrl, phoneNumber, countryCode];
}
