import 'dart:convert';
import 'package:pharmachy_app/model/general_model.dart';


class LoginModel extends GeneralModel {
  final User? user;
  final String? token;

  LoginModel({
    this.user,
    this.token,
  });

  LoginModel copyWith({
    User? user,
    String? token,
  }) =>
      LoginModel(
        user: user ?? this.user,
        token: token ?? this.token,
      );

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };

  @override
  GeneralModel fromJson(json) {
    return LoginModel.fromJson(json);
  }
}

class User {
  final int? userId;
  final String? userName;
  final String? email;
  final String? password;
  final String? role;
  final bool? verified;
  final bool? verifiedR;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.role,
    this.verified,
    this.verifiedR,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int? userId,
    String? userName,
    String? email,
    String? password,
    String? role,
    bool? verified,
    bool? verifiedR,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
        verified: verified ?? this.verified,
        verifiedR: verifiedR ?? this.verifiedR,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        verified: json["verified"],
        verifiedR: json["verifiedR"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "email": email,
        "password": password,
        "role": role,
        "verified": verified,
        "verifiedR": verifiedR,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
