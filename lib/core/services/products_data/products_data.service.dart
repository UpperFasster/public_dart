import 'package:flutter/material.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/models/models.dart';

import 'abstract/generic_pagination.model.dart';

class ProductsDataService extends ChangeNotifier {
  // ==============================================================
  // Products
  final products = PaginationModel<ProductDTO>(
    fetchFunction: (int page, int size) => HttpClientService.getProducts(
      page,
      size: size,
    ),
  );

  // ==============================================================
  // Cart items
  final cartItems = PaginationModel<CartItem>(
    fetchFunction: (int page, int size) => HttpClientService.getCartItems(
      page,
      size: size,
    ),
  );

  // ==============================================================
  // Product types
  final types = PaginationModel<ProductTypesDTO>(
    fetchFunction: (int page, int size) => HttpClientService.getTypes(
      page,
      size: size,
    ),
  );
  // ==============================================================
}
