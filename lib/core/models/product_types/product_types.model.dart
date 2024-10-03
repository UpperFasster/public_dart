class ProductTypesDTO {
  final String id;
  final String name;

  ProductTypesDTO({
    required this.id,
    required this.name,
  });

  factory ProductTypesDTO.fromJson(Map<String, dynamic> json) {
    return ProductTypesDTO(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<ProductTypesDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductTypesDTO.fromJson(json)).toList();
  }
}
