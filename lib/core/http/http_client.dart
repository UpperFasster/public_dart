import 'package:dio/dio.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/core/services/services.dart';

class HttpClientService {
  static Future<UserDTO> login(LoginDTO loginDTO) async {
    var dio = getIt.get<Dio>();

    final response = await dio.post(
      '/auth/login',
      data: loginDTO.toJson(),
    );
    return UserDTO.fromJson(response.data);
  }

  static Future<void> registration(RegistrationDTO registrationDTO) async {
    var dio = getIt.get<Dio>();

    await dio.post(
      '/auth/register',
      data: registrationDTO.toJson(),
    );
    return;
  }

  static Future<List<ProductDTO>> getProducts(
    int page, {
    int size = 10,
  }) async {
    var dio = getIt.get<Dio>();

    final response = await dio.get(
      '/food/foods',
    );

    return ProductDTO.fromJsonList(response.data);
  }

  static Future<List<CartItem>> getCartItems(
    int page, {
    int size = 10,
  }) async {
    var dio = getIt.get<Dio>();

    final response = await dio.get(
      '/client/private/cart',
    );

    return CartItem.fromJsonList(response.data);
  }

  static Future<List<ProductTypesDTO>> getTypes(
    int page, {
    int size = 10,
  }) async {
    var dio = getIt.get<Dio>();

    final response = await dio.get(
      '/food/types',
    );

    return ProductTypesDTO.fromJsonList(response.data);
  }

  static Future<List<ProductDTO>> getProductByType(
    String foodTypeId, {
    int page = 0,
    int size = 10,
  }) async {
    var dio = getIt.get<Dio>();

    final response = await dio.get(
      '/food/byType/$foodTypeId',
    );

    return ProductDTO.fromJsonList(response.data);
  }

  static Future<ProductDTO> getProductById(String productId) async {
    var dio = getIt.get<Dio>();

    final response = await dio.get(
      '/food/$productId',
    );

    return ProductDTO.fromJson(response.data);
  }

  static Future<void> addToCart(String productId, int count) async {
    var dio = getIt.get<Dio>();

    await dio.post(
      '/client/cart/add',
      queryParameters: {
        'foodId': productId,
        'count': count,
      },
    );
  }

  static String photoLink(String photoName) {
    return 'http://127.0.0.1:8080/client/file?name=$photoName';
  }
}
