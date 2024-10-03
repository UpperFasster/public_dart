import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/src/pages/pages.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

part 'path_names.dart';

class AppRouter {
  static GoRouter get routes => GoRouter(
        initialLocation: PathName.inital,
        routes: [
          GoRoute(
            path: PathName.inital,
            builder: (context, state) => const InitalPage(),
            routes: [
              StatefulShellRoute.indexedStack(
                branches: [
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: PathName._products,
                        builder: (context, state) => const ProductsListPage(),
                        routes: [
                          GoRoute(
                            path: '${PathName._itemProduct}/:id',
                            pageBuilder: (context, state) => SwipeablePage(
                              builder: (context) => ProductPage(
                                productId: state.pathParameters['id']!,
                              ),
                            ),
                          ),
                          GoRoute(
                            path: '${PathName._productsByTypes}/:id',
                            pageBuilder: (context, state) => SwipeablePage(
                              builder: (context) => ProductsByTypePage(
                                productId: state.pathParameters['id']!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: PathName._cart,
                        builder: (context, state) => const CartItemPage(),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: PathName._settings,
                        builder: (context, state) => const SettingsPage(),
                      ),
                    ],
                  ),
                ],
                builder: (context, state, navigationShell) {
                  return MainApplicationPage(
                    navigationShell: navigationShell,
                  );
                },
              ),
              GoRoute(
                path: PathName.checkout,
                builder: (context, state) => const CheckoutPage(),
              ),
            ],
          ),
          GoRoute(
              path: PathName.login,
              builder: (context, state) {
                return const LoginPage();
              }
              // pageBuilder: (context, state) {
              //   // return CustomTransitionPage(
              //   //   child: const LoginPage(),
              //   //   // transitionsBuilder:
              //   //   //     (context, animation, secondaryAnimation, child) {
              //   //   //   const begin = Offset(-1.0, 0.0);
              //   //   //   const end = Offset.zero;
              //   //   //   const curve = Curves.easeInOut;

              //   //   //   var tween = Tween(begin: begin, end: end)
              //   //   //       .chain(CurveTween(curve: curve));
              //   //   //   var offsetAnimation = animation.drive(tween);

              //   //   //   return SlideTransition(
              //   //   //     position: offsetAnimation,
              //   //   //     child: child,
              //   //   //   );
              //   //   // },
              //   // );
              // },
              ),
          GoRoute(
            path: PathName.registration,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const RegistrationPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve),
                  );
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              );
            },
          ),
        ],
      );
}
