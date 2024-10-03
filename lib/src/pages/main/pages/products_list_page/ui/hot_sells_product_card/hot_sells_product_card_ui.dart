import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_court/src/widgets/widgets.dart';

import '../../../../../../../../../core/models/models.dart';

@Deprecated('remove this widget')
class HotSellsProductCardUi extends StatelessWidget {
  final HotSelledProduct hotSelledProduct;
  const HotSellsProductCardUi(this.hotSelledProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("HOT SELLS ID: ${hotSelledProduct.id}");
      },
      child: Card(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: ImageLoader(hotSelledProduct.image),
            ),
          ],
        ),
      ),
    );
  }
}
