import 'dart:convert';

class UserEntity {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserEntity.fromRawJson(String str) =>
      UserEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
