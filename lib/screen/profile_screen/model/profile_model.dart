import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class ProfileModel extends GeneralModel {
  final Data? data;

  ProfileModel({
    this.data,
  });

  ProfileModel copyWith({
    Data? data,
  }) =>
      ProfileModel(
        data: data ?? this.data,
      );

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return ProfileModel.fromJson(json);
  }
}

class Data {
  final int? userId;
  final String? userName;
  final String? email;
  final String? password;
  final String? role;
  final bool? verified;
  final bool? verifiedR;
  final dynamic location;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.role,
    this.verified,
    this.verifiedR,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? userId,
    String? userName,
    String? email,
    String? password,
    String? role,
    bool? verified,
    bool? verifiedR,
    dynamic location,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        role: role ?? this.role,
        verified: verified ?? this.verified,
        verifiedR: verifiedR ?? this.verifiedR,
        location: location ?? this.location,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        verified: json["verified"],
        verifiedR: json["verifiedR"],
        location: json["location"],
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
        "location": location,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
