import 'dart:convert';

// Model class for individual product item
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

  // Factory constructor to create a ProductItem from JSON
  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      name: json['name'],
      image: json['image'],
      price: double.parse(json['price']),
      id: int.parse(json['id']),
    );
  }

  // Method to convert a ProductItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price.toString(),
      'id': id.toString(),
    };
  }
}

// Model class for handling a list of ProductItems
class ProductItemList {
  final List<ProductItem> items;

  ProductItemList({required this.items});

  // Factory constructor to create a ProductItemList from JSON
  factory ProductItemList.fromJson(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<ProductItem> productList = jsonData
        .map((item) => ProductItem.fromJson(item as Map<String, dynamic>))
        .toList();
    return ProductItemList(items: productList);
  }

  // Method to convert a ProductItemList to JSON
  String toJson() {
    final List<Map<String, dynamic>> jsonData =
        items.map((item) => item.toJson()).toList();
    return json.encode(jsonData);
  }
}
