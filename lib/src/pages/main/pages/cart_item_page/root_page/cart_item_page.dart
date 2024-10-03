import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/core/services/products_data/products_data.service.dart';
import 'package:food_court/src/clippers/clippers.dart';
import 'package:food_court/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../ui/ui.dart';
import '../widgets/widgets.dart';

class CartItemPage extends StatefulWidget {
  const CartItemPage({super.key});

  @override
  State<CartItemPage> createState() => _CartItemPageState();
}

class _CartItemPageState extends State<CartItemPage> {
  @override
  void initState() {
    log('Init cart items page');
    if (context.read<ProductsDataService>().cartItems.items.isEmpty) {
      log('Cart item is empty, getting from backend');
      _getCartItems();
    }
    super.initState();
  }

  Future<void> _getCartItems() async {
    await context.read<ProductsDataService>().cartItems.getItems();
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 10;
    final theme = Theme.of(context);
    final cartItems = context.watch<ProductsDataService>().cartItems;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constr) {
          return Container(
            color: theme.colorScheme.onPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: TextLabelUi(
                    "Cart",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily!,
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                    ).copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    paddingSize: horizontalPadding,
                  ),
                ),
                Expanded(
                  child: ClipPath(
                    clipper: NotchShapeClipper(
                      topOffset: 0.02,
                      bottomOffset: 1,
                      notchWiderSpace: 0.23,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.all(horizontalPadding),
                            child: Column(
                              children: [
                                const SizedBox(height: 25),
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  clipBehavior: Clip.none,
                                  itemCount: cartItems.items.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 40);
                                  },
                                  itemBuilder: (context, index) {
                                    return ItemInCartCard(
                                      cartItems.items[index],
                                    );
                                  },
                                ),
                                const SizedBox(height: 80),
                              ],
                            ),
                          ),
                        ),
                        if (cartItems.items.isNotEmpty)
                          Positioned(
                            bottom: 4,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              width: constr.maxWidth,
                              child: CheckOutButtonUi(
                                "Checkout",
                                onTap: () {
                                  context.go(PathName.checkout);
                                },
                                height: 60,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
