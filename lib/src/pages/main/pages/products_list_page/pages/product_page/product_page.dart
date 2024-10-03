import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/models/models.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductDTO? _productDTO;
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    log(widget.productId);
    _getProductById();
    super.initState();
  }

  Future<void> _getProductById() async {
    try {
      final ProductDTO product =
          await HttpClientService.getProductById(widget.productId);
      setState(() {
        _productDTO = product;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load product details';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : _errorMessage != null
              ? Center(
                  child: Text(_errorMessage!),
                )
              : Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 80.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Buy now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 400.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                            ),
                            items: _productDTO!.additionalImage.map((imageUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.network(
                                      HttpClientService.photoLink(imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _productDTO!.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${_productDTO!.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text(
                                      'Color: ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        _buildColorOption(Colors.black),
                                        _buildColorOption(Colors.blue),
                                        _buildColorOption(Colors.pink),
                                        _buildColorOption(Colors.grey),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  _productDTO!.description,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '• Supersonic hairdryer',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[800]),
                                ),
                                Text(
                                  '• Flyaway attachment',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
