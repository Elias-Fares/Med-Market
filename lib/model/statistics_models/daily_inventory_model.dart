import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class DailyInventoryModel extends GeneralModel {
  final List<String>? result;
  final int? sum;

  DailyInventoryModel({
    this.result,
    this.sum,
  });

  DailyInventoryModel copyWith({
    List<String>? result,
    int? sum,
  }) =>
      DailyInventoryModel(
        result: result ?? this.result,
        sum: sum ?? this.sum,
      );

  factory DailyInventoryModel.fromRawJson(String str) =>
      DailyInventoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyInventoryModel.fromJson(Map<String, dynamic> json) =>
      DailyInventoryModel(
        result: json["result"] == null
            ? []
            : List<String>.from(json["result"]!.map((x) => x)),
        sum: json["sum"],
      );

  Map<String, dynamic> toJson() => {
        "result":
            result == null ? [] : List<dynamic>.from(result!.map((x) => x)),
        "sum": sum,
      };

  @override
  GeneralModel fromJson(json) {
    return DailyInventoryModel.fromJson(json);
  }
}
