part of 'router.dart';

class PathName {
  static String get inital => '/';

  static String get _products => 'products';
  static String get products => '/$_products';

  static String get _cart => 'cart';
  static String get cart => '/$_cart';

  static String get _cuts => 'cuts';
  static String get cuts => '/$_cuts';

  static String get _settings => 'settings';
  static String get settings => '/$_settings';

  static String get login => '/login';

  static String get registration => '/registration';

  static String get checkout => 'checkout';

  static String get _itemProduct => 'item';
  static String productById(String id) => '$products/$_itemProduct/$id';

  static String get _productsByTypes => 'prodcutByType';
  static String productsByType(String id) => '$products/$_productsByTypes/$id';
}
