class ProductDTO {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String image;
  final List<String> additionalImage;
  final String foodType;
  final bool liked;
  final bool favorite;
  final int likedCount;
  final int favoriteCount;
  final int viewCount;
  final int commentCount;

  ProductDTO({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.image,
    required this.additionalImage,
    required this.foodType,
    required this.liked,
    required this.favorite,
    required this.likedCount,
    required this.favoriteCount,
    required this.viewCount,
    required this.commentCount,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      image: json['image'] as String,
      additionalImage: List<String>.from(json['additionalImage'] ?? []),
      foodType: json['foodType'] as String,
      liked: json['liked'] as bool,
      favorite: json['favorite'] as bool,
      likedCount: json['likedCount'] as int,
      favoriteCount: json['favoriteCount'] as int,
      viewCount: json['viewCount'] as int,
      commentCount: json['commentCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'image': image,
      'additionalImage': additionalImage,
      'foodType': foodType,
      'liked': liked,
      'favorite': favorite,
      'likedCount': likedCount,
      'favoriteCount': favoriteCount,
      'viewCount': viewCount,
      'commentCount': commentCount,
    };
  }

  static List<ProductDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductDTO.fromJson(json)).toList();
  }
}
