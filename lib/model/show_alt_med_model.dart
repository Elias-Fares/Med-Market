import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class ShowAltMedModel extends GeneralModel {
  final Data? data;

  ShowAltMedModel({
    this.data,
  });

  ShowAltMedModel copyWith({
    Data? data,
  }) =>
      ShowAltMedModel(
        data: data ?? this.data,
      );

  factory ShowAltMedModel.fromRawJson(String str) =>
      ShowAltMedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShowAltMedModel.fromJson(Map<String, dynamic> json) =>
      ShowAltMedModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return ShowAltMedModel.fromJson(json);
  }
}

class Data {
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
  final DateTime? expiredDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? companyCompanyId;
  final List<Altmed>? altmeds;

  Data({
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
    this.expiredDate,
    this.createdAt,
    this.updatedAt,
    this.companyCompanyId,
    this.altmeds,
  });

  Data copyWith({
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
    DateTime? expiredDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? companyCompanyId,
    List<Altmed>? altmeds,
  }) =>
      Data(
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
        expiredDate: expiredDate ?? this.expiredDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        companyCompanyId: companyCompanyId ?? this.companyCompanyId,
        altmeds: altmeds ?? this.altmeds,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        medicineId: json["medicineId"],
        medicineBarcode: json["medicineBarcode"],
        medicineName: json["medicineName"],
        pharmaceuticalIndications: json["pharmaceuticalIndications"],
        pharmaceuticalComposition: json["pharmaceuticalComposition"],
        price: json["price"],
        quantity: json["quantity"],
        lowBound: json["lowBound"],
        pharmaceuticalTiter: json["pharmaceuticalTiter"],
        medicineImageUrl: json["medicineImageUrl"],
        expiredDate: json["expiredDate"] == null
            ? null
            : DateTime.parse(json["expiredDate"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        companyCompanyId: json["companyCompanyId"],
        altmeds: json["altmeds"] == null
            ? []
            : List<Altmed>.from(
                json["altmeds"]!.map((x) => Altmed.fromJson(x))),
      );

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
        "expiredDate": expiredDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "companyCompanyId": companyCompanyId,
        "altmeds": altmeds == null
            ? []
            : List<dynamic>.from(altmeds!.map((x) => x.toJson())),
      };
}

class Altmed {
  final int? altmedId;
  final int? altmed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? medicineMedicineId;

  Altmed({
    this.altmedId,
    this.altmed,
    this.createdAt,
    this.updatedAt,
    this.medicineMedicineId,
  });

  Altmed copyWith({
    int? altmedId,
    int? altmed,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? medicineMedicineId,
  }) =>
      Altmed(
        altmedId: altmedId ?? this.altmedId,
        altmed: altmed ?? this.altmed,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        medicineMedicineId: medicineMedicineId ?? this.medicineMedicineId,
      );

  factory Altmed.fromRawJson(String str) => Altmed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Altmed.fromJson(Map<String, dynamic> json) => Altmed(
        altmedId: json["altmedId"],
        altmed: json["altmed"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        medicineMedicineId: json["medicineMedicineId"],
      );

  Map<String, dynamic> toJson() => {
        "altmedId": altmedId,
        "altmed": altmed,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "medicineMedicineId": medicineMedicineId,
      };
}
