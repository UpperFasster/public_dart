import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/src/widgets/widgets.dart';

import 'widgets/widgets.dart';

class ProductsByTypePage extends StatefulWidget {
  final String productId;
  const ProductsByTypePage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductsByTypePage> createState() => _ProductsByTypePageState();
}

class _ProductsByTypePageState extends State<ProductsByTypePage> {
  List<ProductDTO> _productsByType = [];
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProductsByType();
  }

  Future<void> _fetchProductsByType() async {
    try {
      final List<ProductDTO> responseData =
          await HttpClientService.getProductByType(widget.productId);
      setState(() {
        _productsByType = responseData;
        _loading = false; // Data successfully loaded
      });
    } on DioException catch (e) {
      log('Got error: ${e.response?.statusCode}');
      setState(() {
        _errorMessage = 'Failed to load products';
        _loading = false; // Stop loading if there’s an error
      });
    } catch (e) {
      log('Unexpected error: $e');
      setState(() {
        _errorMessage = 'Something went wrong';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoadingPage(
          isLoading: _loading,
          errorMessage: _errorMessage,
          child: ProductsByTypeWidget(
            productsByType: _productsByType,
          ),
        ),
      ),
    );
  }
}
