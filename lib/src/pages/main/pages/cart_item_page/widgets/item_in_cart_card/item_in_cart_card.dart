import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/src/widgets/widgets.dart';

import '../../../../../../../../../core/models/models.dart';

class ItemInCartCard extends StatefulWidget {
  final CartItem product;
  const ItemInCartCard(this.product, {super.key});

  @override
  State<ItemInCartCard> createState() => _ItemInCartCardState();
}

class _ItemInCartCardState extends State<ItemInCartCard> {
  int _itemCount = 1;

  void _incrementItemCount() {
    setState(() {
      _itemCount++;
    });
  }

  void _decrementItemCount() {
    setState(() {
      if (_itemCount > 1) {
        _itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = 80;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.go(PathName.productById(
          widget.product.food.id.toString(),
        ));
      },
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                height: height * 0.8,
                width: height * 0.8,
                child: ImageLoader(
                  widget.product.food.image,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.food.name,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'By: ',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.primary.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        'Market',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium!.copyWith(
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.primary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 50),
            MoneyWhiteWidget(
              widget.product.food.price,
            )
          ],
        ),
      ),
    );
  }
}
