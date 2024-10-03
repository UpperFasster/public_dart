import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/core/services/services.dart';
import 'package:food_court/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TypeProductList extends StatelessWidget {
  const TypeProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final productsDataService = context.watch<ProductsDataService>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabelUi(
          'Type of products',
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          paddingSize: 0,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          itemCount: productsDataService.types.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, i) {
            final t = productsDataService.types.items[i];
            return GestureDetector(
              onTap: () {
                context.go(PathName.productsByType(t.id));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                  borderRadius: BorderRadius.circular(30 + 5),
                ),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LayoutBuilder(
                      builder: (context, constr) {
                        return Container(
                          alignment: Alignment.center,
                          height: constr.maxHeight,
                          width: constr.maxHeight,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: theme.colorScheme.surface,
                          ),
                          child: SvgPicture.asset(
                            'lib/assets/cupcake.svg',
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          t.name,
                          style: theme.textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
