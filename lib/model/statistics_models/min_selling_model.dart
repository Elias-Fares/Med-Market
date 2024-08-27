import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class MinSellingModel extends GeneralModel {
  final String? min;
  final String? name;
  final String? photo;

  MinSellingModel({
    this.min,
    this.name,
    this.photo,
  });

  MinSellingModel copyWith({
    String? min,
    String? name,
    String? photo,
  }) =>
      MinSellingModel(
        min: min ?? this.min,
        name: name ?? this.name,
        photo: photo ?? this.photo,
      );

  factory MinSellingModel.fromRawJson(String str) =>
      MinSellingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MinSellingModel.fromJson(Map<String, dynamic> json) =>
      MinSellingModel(
        min: json["Min"],
        name: json["Name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "Min": min,
        "Name": name,
        "photo": photo,
      };

  @override
  GeneralModel fromJson(json) {
    return MinSellingModel.fromJson(json);
  }
}
