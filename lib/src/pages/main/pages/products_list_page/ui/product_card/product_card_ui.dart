import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/models/product/product.model.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/src/widgets/widgets.dart';

class ProductCardUi extends StatelessWidget {
  final ProductDTO product;
  const ProductCardUi(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.go(PathName.productById(
          product.id.toString(),
        ));
      },
      child: LayoutBuilder(builder: (context, constr) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: constr.maxWidth * 1.15,
              width: constr.maxWidth,
              child: ImageLoader(
                HttpClientService.photoLink(product.image),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              product.name,
              style: theme.textTheme.labelMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            MoneyWhiteWidget(
              product.price,
              height: 28,
              borderRadius: BorderRadius.circular(10),
              bgColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
            ),
          ],
        );
      }),
    );
  }
}
