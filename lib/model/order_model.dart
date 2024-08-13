import 'dart:convert';

import 'product_list_model.dart';

class OrderModel {
  final String customerName;
  final String customerAddress;
  final String customerPhoneNumber;
  final List<ProductItem> orderedItems;
  final double totalPrice;
  final DateTime orderDate;

  OrderModel({
    required this.customerName,
    required this.customerAddress,
    required this.customerPhoneNumber,
    required this.orderedItems,
    required this.totalPrice,
    required this.orderDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsJson = json['orderedItems'];
    final List<ProductItem> orderedItems = itemsJson
        .map((item) => ProductItem.fromJson(item as Map<String, dynamic>))
        .toList();

    return OrderModel(
      customerName: json['customerName'],
      customerAddress: json['customerAddress'],
      customerPhoneNumber: json['customerPhoneNumber'],
      orderedItems: orderedItems,
      totalPrice: double.parse(json['totalPrice']),
      orderDate: DateTime.parse(json['orderDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'customerAddress': customerAddress,
      'customerPhoneNumber': customerPhoneNumber,
      'orderedItems': orderedItems.map((item) => item.toJson()).toList(),
      'totalPrice': totalPrice.toString(),
      'orderDate': orderDate.toIso8601String(),
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  factory OrderModel.fromJsonString(String jsonString) {
    return OrderModel.fromJson(json.decode(jsonString));
  }
}
