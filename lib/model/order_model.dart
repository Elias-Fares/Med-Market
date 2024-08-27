import 'dart:convert';

import 'package:pharmachy_app/model/general_model.dart';

class OrderModel extends GeneralModel {
  final int? orderId;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userUserId;
  final List<Medicine>? medicines;

  OrderModel({
    this.orderId,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.userUserId,
    this.medicines,
  });

  OrderModel copyWith({
    int? orderId,
    String? state,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userUserId,
    List<Medicine>? medicines,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userUserId: userUserId ?? this.userUserId,
        medicines: medicines ?? this.medicines,
      );

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json["orderId"],
        state: json["state"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        userUserId: json["userUserId"],
        medicines: json["medicines"] == null
            ? []
            : List<Medicine>.from(
                json["medicines"]!.map((x) => Medicine.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "state": state,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "userUserId": userUserId,
        "medicines": medicines == null
            ? []
            : List<dynamic>.from(medicines!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return OrderModel.fromJson(json);
  }
}

class Medicine {
  final String? medicineName;
  final int? price;
  final String? medicineImageUrl;
  final OpRelation? opRelation;

  Medicine({
    this.medicineName,
    this.price,
    this.medicineImageUrl,
    this.opRelation,
  });

  Medicine copyWith({
    String? medicineName,
    int? price,
    String? medicineImageUrl,
    OpRelation? opRelation,
  }) =>
      Medicine(
        medicineName: medicineName ?? this.medicineName,
        price: price ?? this.price,
        medicineImageUrl: medicineImageUrl ?? this.medicineImageUrl,
        opRelation: opRelation ?? this.opRelation,
      );

  factory Medicine.fromRawJson(String str) =>
      Medicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        medicineName: json["medicineName"],
        price: json["price"].toInt(),
        medicineImageUrl: json["medicineImageUrl"],
        opRelation: json["op_relation"] == null
            ? null
            : OpRelation.fromJson(json["op_relation"]),
      );

  Map<String, dynamic> toJson() => {
        "medicineName": medicineName,
        "price": price,
        "medicineImageUrl": medicineImageUrl,
        "op_relation": opRelation?.toJson(),
      };
}

class OpRelation {
  final int? opRelationId;
  final int? count;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? medicineMedicineId;
  final int? orderOrderId;

  OpRelation({
    this.opRelationId,
    this.count,
    this.createdAt,
    this.updatedAt,
    this.medicineMedicineId,
    this.orderOrderId,
  });

  OpRelation copyWith({
    int? opRelationId,
    int? count,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? medicineMedicineId,
    int? orderOrderId,
  }) =>
      OpRelation(
        opRelationId: opRelationId ?? this.opRelationId,
        count: count ?? this.count,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        medicineMedicineId: medicineMedicineId ?? this.medicineMedicineId,
        orderOrderId: orderOrderId ?? this.orderOrderId,
      );

  factory OpRelation.fromRawJson(String str) =>
      OpRelation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OpRelation.fromJson(Map<String, dynamic> json) => OpRelation(
        opRelationId: json["op_relationId"],
        count: json["count"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        medicineMedicineId: json["medicineMedicineId"],
        orderOrderId: json["orderOrderId"],
      );

  Map<String, dynamic> toJson() => {
        "op_relationId": opRelationId,
        "count": count,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "medicineMedicineId": medicineMedicineId,
        "orderOrderId": orderOrderId,
      };
}
