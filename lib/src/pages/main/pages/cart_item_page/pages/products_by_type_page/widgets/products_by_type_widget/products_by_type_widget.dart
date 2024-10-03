import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/src/widgets/widgets.dart';

class ProductsByTypeWidget extends StatelessWidget {
  final List<ProductDTO> productsByType;
  const ProductsByTypeWidget({
    super.key,
    required this.productsByType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                'Menu',
                style: theme.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 48), // Ensure space for alignment
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6, // Adjusted for better image-to-text fit
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemCount: productsByType.length,
            itemBuilder: (context, i) {
              final p = productsByType[i];
              return LayoutBuilder(
                builder: (context, constr) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: theme.colorScheme.primary,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: constr.maxHeight * 0.8,
                                width: constr.maxWidth,
                                child: ImageLoader(
                                  HttpClientService.photoLink(p.image),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: MoneyWhiteWidget(
                                  p.price,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                  bgColor: theme.colorScheme.onPrimary,
                                  textColor: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${p.name}asd asdas d sa as9odjh osauhd oiash dopu',
                        style: theme.textTheme.labelMedium!.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
