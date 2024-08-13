import 'dart:convert';

class ProductItem {
  final String name;
  final String image;
  final double price;
  final int id;

  ProductItem({
    required this.name,
    required this.image,
    required this.price,
    required this.id,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      name: json['name'],
      image: json['image'],
      price: double.parse(json['price']),
      id: int.parse(json['id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price.toString(),
      'id': id.toString(),
    };
  }
}

class ProductItemList {
  final List<ProductItem> items;

  ProductItemList({required this.items});

  factory ProductItemList.fromJson(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<ProductItem> productList = jsonData
        .map((item) => ProductItem.fromJson(item as Map<String, dynamic>))
        .toList();
    return ProductItemList(items: productList);
  }

  String toJson() {
    final List<Map<String, dynamic>> jsonData =
        items.map((item) => item.toJson()).toList();
    return json.encode(jsonData);
  }
}
