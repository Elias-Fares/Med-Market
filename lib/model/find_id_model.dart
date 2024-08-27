import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class FindIdModel extends GeneralModel {
  final dynamic myresult;

  FindIdModel({
    this.myresult,
  });

  FindIdModel copyWith({
    dynamic myresult,
  }) =>
      FindIdModel(
        myresult: myresult ?? this.myresult,
      );

  factory FindIdModel.fromRawJson(String str) =>
      FindIdModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FindIdModel.fromJson(Map<String, dynamic> json) => FindIdModel(
        myresult: json["myresult"],
      );

  Map<String, dynamic> toJson() => {
        "myresult": myresult,
      };

  @override
  GeneralModel fromJson(json) {
    return FindIdModel.fromJson(json);
  }
}
