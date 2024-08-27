import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class CompanyModel extends GeneralModel {
  final int? companyId;
  final String? companyName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CompanyModel({
    this.companyId,
    this.companyName,
    this.createdAt,
    this.updatedAt,
  });

  CompanyModel copyWith({
    int? companyId,
    String? companyName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CompanyModel(
        companyId: companyId ?? this.companyId,
        companyName: companyName ?? this.companyName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CompanyModel.fromRawJson(String str) =>
      CompanyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        companyId: json["companyId"],
        companyName: json["companyName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "companyName": companyName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  GeneralModel fromJson(json) {
    return CompanyModel.fromJson(json);
  }
}
