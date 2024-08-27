import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';
import 'package:pharmachy_app/model/medicine_model.dart';

class ShowFromBarcodeModel extends GeneralModel {
  final MedicineModel? data;

  ShowFromBarcodeModel({
    this.data,
  });

  ShowFromBarcodeModel copyWith({
    MedicineModel? data,
  }) =>
      ShowFromBarcodeModel(
        data: data ?? this.data,
      );

  factory ShowFromBarcodeModel.fromRawJson(String str) =>
      ShowFromBarcodeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShowFromBarcodeModel.fromJson(Map<String, dynamic> json) =>
      ShowFromBarcodeModel(
        data: json["data"] == null ? null : MedicineModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return ShowFromBarcodeModel.fromJson(json);
  }
}

// class Data {
//   final int? medicineId;
//   final String? medicineBarcode;
//   final String? medicineName;
//   final String? pharmaceuticalIndications;
//   final String? pharmaceuticalComposition;
//   final int? price;
//   final int? quantity;
//   final int? lowBound;
//   final int? pharmaceuticalTiter;
//   final String? medicineImageUrl;
//   final DateTime? expiredDate;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? companyCompanyId;

//   Data({
//     this.medicineId,
//     this.medicineBarcode,
//     this.medicineName,
//     this.pharmaceuticalIndications,
//     this.pharmaceuticalComposition,
//     this.price,
//     this.quantity,
//     this.lowBound,
//     this.pharmaceuticalTiter,
//     this.medicineImageUrl,
//     this.expiredDate,
//     this.createdAt,
//     this.updatedAt,
//     this.companyCompanyId,
//   });

//   Data copyWith({
//     int? medicineId,
//     String? medicineBarcode,
//     String? medicineName,
//     String? pharmaceuticalIndications,
//     String? pharmaceuticalComposition,
//     int? price,
//     int? quantity,
//     int? lowBound,
//     int? pharmaceuticalTiter,
//     String? medicineImageUrl,
//     DateTime? expiredDate,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     int? companyCompanyId,
//   }) =>
//       Data(
//         medicineId: medicineId ?? this.medicineId,
//         medicineBarcode: medicineBarcode ?? this.medicineBarcode,
//         medicineName: medicineName ?? this.medicineName,
//         pharmaceuticalIndications:
//             pharmaceuticalIndications ?? this.pharmaceuticalIndications,
//         pharmaceuticalComposition:
//             pharmaceuticalComposition ?? this.pharmaceuticalComposition,
//         price: price ?? this.price,
//         quantity: quantity ?? this.quantity,
//         lowBound: lowBound ?? this.lowBound,
//         pharmaceuticalTiter: pharmaceuticalTiter ?? this.pharmaceuticalTiter,
//         medicineImageUrl: medicineImageUrl ?? this.medicineImageUrl,
//         expiredDate: expiredDate ?? this.expiredDate,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         companyCompanyId: companyCompanyId ?? this.companyCompanyId,
//       );

//   factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         medicineId: json["medicineId"],
//         medicineBarcode: json["medicineBarcode"],
//         medicineName: json["medicineName"],
//         pharmaceuticalIndications: json["pharmaceuticalIndications"],
//         pharmaceuticalComposition: json["pharmaceuticalComposition"],
//         price: json["price"],
//         quantity: json["quantity"],
//         lowBound: json["lowBound"],
//         pharmaceuticalTiter: json["pharmaceuticalTiter"],
//         medicineImageUrl: json["medicineImageUrl"],
//         expiredDate: json["expiredDate"] == null
//             ? null
//             : DateTime.parse(json["expiredDate"]),
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         companyCompanyId: json["companyCompanyId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "medicineId": medicineId,
//         "medicineBarcode": medicineBarcode,
//         "medicineName": medicineName,
//         "pharmaceuticalIndications": pharmaceuticalIndications,
//         "pharmaceuticalComposition": pharmaceuticalComposition,
//         "price": price,
//         "quantity": quantity,
//         "lowBound": lowBound,
//         "pharmaceuticalTiter": pharmaceuticalTiter,
//         "medicineImageUrl": medicineImageUrl,
//         "expiredDate": expiredDate?.toIso8601String(),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "companyCompanyId": companyCompanyId,
//       };
// }
