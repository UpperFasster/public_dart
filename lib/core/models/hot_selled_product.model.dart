class HotSelledProduct {
  final int id;
  final String name;
  final double price;
  final String image;

  HotSelledProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory HotSelledProduct.fromJson(Map<String, dynamic> json) {
    return HotSelledProduct(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
