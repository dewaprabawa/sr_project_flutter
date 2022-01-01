import 'package:sr_project_flutter/app/features/auth/domain/entities/user_entitiy.dart';

class AppUser extends UserEntity {
  const AppUser({
    required String token,
    required String id,
    required String username,
    required String email,
    required List<String> roles,
    required String profileImageUrl,
    required String phoneNumber,
    required String countryCode,
  }) : super(
            token: token,
            id: id,
            username: username,
            email: email,
            roles: roles,
            profileImageUrl: profileImageUrl,
            phoneNumber: phoneNumber,
            countryCode: countryCode);

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        token: json["token"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        roles: json["roles"],
        profileImageUrl: json["profileImageUrl"],
        phoneNumber: json["phoneNumber"],
        countryCode: json["countryCode"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "roles": roles,
      "profileImageUrl": profileImageUrl,
      "phoneNumber": phoneNumber,
      "countryCode": countryCode
    };
  }
}
