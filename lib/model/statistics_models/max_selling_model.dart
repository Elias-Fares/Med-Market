import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class MaxSellingModel extends GeneralModel {
  final String? max;
  final String? name;
  final String? photo;

  MaxSellingModel({
    this.max,
    this.name,
    this.photo,
  });

  MaxSellingModel copyWith({
    String? max,
    String? name,
    String? photo,
  }) =>
      MaxSellingModel(
        max: max ?? this.max,
        name: name ?? this.name,
        photo: photo ?? this.photo,
      );

  factory MaxSellingModel.fromRawJson(String str) =>
      MaxSellingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaxSellingModel.fromJson(Map<String, dynamic> json) =>
      MaxSellingModel(
        max: json["Max"],
        name: json["Name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "Max": max,
        "Name": name,
        "photo": photo,
      };

  @override
  GeneralModel fromJson(json) {
    return MaxSellingModel.fromJson(json);
  }
}
