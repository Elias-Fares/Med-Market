import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class MedicineModel extends GeneralModel {
  final int? medicineId;
  final String? medicineBarcode;
  final String? medicineName;
  final String? pharmaceuticalIndications;
  final String? pharmaceuticalComposition;
  final int? price;
  final int? quantity;
  final int? lowBound;
  final dynamic pharmaceuticalTiter;
  final String? medicineImageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? companyCompanyId;
  final DateTime? expiredDate;

  MedicineModel({
    this.medicineId,
    this.medicineBarcode,
    this.medicineName,
    this.pharmaceuticalIndications,
    this.pharmaceuticalComposition,
    this.price,
    this.quantity,
    this.lowBound,
    this.pharmaceuticalTiter,
    this.medicineImageUrl,
    this.createdAt,
    this.updatedAt,
    this.companyCompanyId,
    this.expiredDate,
  });

  MedicineModel copyWith({
    int? medicineId,
    String? medicineBarcode,
    String? medicineName,
    String? pharmaceuticalIndications,
    String? pharmaceuticalComposition,
    int? price,
    int? quantity,
    int? lowBound,
    dynamic pharmaceuticalTiter,
    String? medicineImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? companyCompanyId,
    DateTime? expiredDate,
  }) =>
      MedicineModel(
        medicineId: medicineId ?? this.medicineId,
        medicineBarcode: medicineBarcode ?? this.medicineBarcode,
        medicineName: medicineName ?? this.medicineName,
        pharmaceuticalIndications:
            pharmaceuticalIndications ?? this.pharmaceuticalIndications,
        pharmaceuticalComposition:
            pharmaceuticalComposition ?? this.pharmaceuticalComposition,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        lowBound: lowBound ?? this.lowBound,
        pharmaceuticalTiter: pharmaceuticalTiter ?? this.pharmaceuticalTiter,
        medicineImageUrl: medicineImageUrl ?? this.medicineImageUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        companyCompanyId: companyCompanyId ?? this.companyCompanyId,
        expiredDate: expiredDate ?? this.expiredDate,
      );

  factory MedicineModel.fromRawJson(String str) =>
      MedicineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        medicineId: json["medicineId"],
        medicineBarcode: json["medicineBarcode"],
        medicineName: json["medicineName"],
        pharmaceuticalIndications: json["pharmaceuticalIndications"],
        pharmaceuticalComposition: json["pharmaceuticalComposition"],
        price: json["price"].toInt(),
        quantity: json["quantity"],
        lowBound: json["lowBound"],
        pharmaceuticalTiter: json["pharmaceuticalTiter"],
        medicineImageUrl: json["medicineImageUrl"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        companyCompanyId: json["companyCompanyId"],
        expiredDate: json["expiredDate"] == null
            ? null
            : DateTime.parse(json["expiredDate"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "medicineId": medicineId,
        "medicineBarcode": medicineBarcode,
        "medicineName": medicineName,
        "pharmaceuticalIndications": pharmaceuticalIndications,
        "pharmaceuticalComposition": pharmaceuticalComposition,
        "price": price,
        "quantity": quantity,
        "lowBound": lowBound,
        "pharmaceuticalTiter": pharmaceuticalTiter,
        "medicineImageUrl": medicineImageUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "companyCompanyId": companyCompanyId,
        "expiredDate": expiredDate?.toIso8601String(),
      };

  @override
  GeneralModel fromJson(json) {
    return MedicineModel.fromJson(json);
  }
}
