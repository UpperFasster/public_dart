import 'package:food_court/core/models/models.dart';

class CartItem {
  final ProductDTO food;
  final int count;

  CartItem({
    required this.food,
    required this.count,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      food: ProductDTO.fromJson(json['food']),
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
      'count': count,
    };
  }

  static List<CartItem> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CartItem.fromJson(json)).toList();
  }
}
