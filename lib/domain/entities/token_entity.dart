import 'dart:convert';

class TokenEntity {
  final int id;
  final String token;
  final String error;

  TokenEntity({
    required this.id,
    required this.token,
    required this.error,
  });

  factory TokenEntity.fromRawJson(String str) =>
      TokenEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenEntity.fromJson(Map<String, dynamic> json) => TokenEntity(
        id: json["id"],
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "error": error,
      };
}
