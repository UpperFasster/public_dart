import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodOfWeek extends StatefulWidget {
  const FoodOfWeek({super.key});

  @override
  State<FoodOfWeek> createState() => _FoodOfWeekState();
}

class _FoodOfWeekState extends State<FoodOfWeek> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<String> types = [
      'Tararam',
      'Kunza',
      'shaurma',
      'Plov',
      'Eda',
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: LayoutBuilder(
        builder: (context, constr) {
          return Stack(
            children: [
              SizedBox(
                height: 170,
                child: PageView(
                  controller: _pageController,
                  children: types.mapIndexed((i, v) {
                    return Container(
                      color: i % 2 == 0
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onPrimary,
                      child: Center(
                        child: Text(
                          v,
                          style: theme.textTheme.labelSmall!.copyWith(
                            color: i % 2 == 0
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 10,
                  ),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: types.length,
                    effect: WormEffect(
                      dotWidth: (constr.maxWidth /
                          (types.length + (types.length - 1) * 0.5)),
                      dotHeight: 3,
                      spacing: (constr.maxWidth / types.length) * 0.1,
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
