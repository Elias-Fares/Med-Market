import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class RegisterModel extends GeneralModel {
  final bool? verified;
  final bool? verifiedR;
  final int? userId;
  final String? userName;
  final String? email;
  final String? password;
  final String? role;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  RegisterModel({
    this.verified,
    this.verifiedR,
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.role,
    this.updatedAt,
    this.createdAt,
  });

  RegisterModel copyWith({
    bool? verified,
    bool? verifiedR,
    int? userId,
    String? userName,
    String? email,
    String? password,
    String? role,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) =>
      RegisterModel(
        verified: verified ?? this.verified,
        verifiedR: verifiedR ?? this.verifiedR,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  factory RegisterModel.fromRawJson(String str) =>
      RegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        verified: json["verified"],
        verifiedR: json["verifiedR"],
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "verifiedR": verifiedR,
        "userId": userId,
        "userName": userName,
        "email": email,
        "password": password,
        "role": role,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
      };

  @override
  GeneralModel fromJson(json) {
    return RegisterModel.fromJson(json);
  }
}


