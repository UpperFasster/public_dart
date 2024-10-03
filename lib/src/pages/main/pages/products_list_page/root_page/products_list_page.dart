import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/core/services/services.dart';
import 'package:food_court/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../ui/ui.dart';
import '../widgets/widgets.dart';

class ProductsListPage extends StatefulWidget {
  static const double paddingSize = 10;

  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  void initState() {
    final pds = getIt.get<ProductsDataService>();
    if (pds.types.items.isEmpty) {
      _getTypes();
    }
    if (pds.products.items.isEmpty) {
      _refresh();
    }
    super.initState();
  }

  Future<void> _getTypes() async {
    await context.read<ProductsDataService>().types.getItems();
  }

  Future<void> _refresh() async {
    await context.read<ProductsDataService>().products.getItems();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextLabelUi(
                      "Good morning.",
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: const Color.fromARGB(255, 165, 165, 165),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextLabelUi(
                      "Jimmy Sulivian",
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(FluentIcons.mail_24_regular),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const FoodOfWeek(),
            const SizedBox(height: 20),
            const TypeProductList(),
            const SizedBox(height: 20),
            const TextLabelUi("Recommended"),
            Builder(builder: (context) {
              List<ProductDTO> products =
                  context.watch<ProductsDataService>().products.items;
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardUi(
                    products[index],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
