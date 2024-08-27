import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class PrescriptionModel extends GeneralModel {
  final List<String>? result;
  final int? sum;

  PrescriptionModel({
    this.result,
    this.sum,
  });

  PrescriptionModel copyWith({
    List<String>? result,
    int? sum,
  }) =>
      PrescriptionModel(
        result: result ?? this.result,
        sum: sum ?? this.sum,
      );

  factory PrescriptionModel.fromRawJson(String str) =>
      PrescriptionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionModel(
        result: json["result"] == null
            ? []
            : List<String>.from(json["result"]!.map((x) => x)),
        sum: json["sum"].toInt(),
      );

  @override
  Map<String, dynamic> toJson() => {
        "result":
            result == null ? [] : List<dynamic>.from(result!.map((x) => x)),
        "sum": sum,
      };

  @override
  GeneralModel fromJson(json) {
    return PrescriptionModel.fromJson(json);
  }
}
