import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PaginationModel<T> extends ChangeNotifier {
  List<T> _items = [];
  List<T> get items => _items;

  int _currentPage = 0;
  int _pageSize = 10;

  int get currentPage => _currentPage;
  int get pageSize => _pageSize;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  final Future<List<T>> Function(int page, int size) fetchFunction;

  PaginationModel({required this.fetchFunction});

  Future<void> getItems({
    int? page,
    int? size,
  }) async {
    if (_isFetching) return;

    int fetchPage = page ?? _currentPage;
    int fetchSize = size ?? _pageSize;

    try {
      _isFetching = true;
      List<T> newItems = await fetchFunction(fetchPage, fetchSize);

      _currentPage = fetchPage + 1;
      _pageSize = fetchSize;

      updateItems(newItems);
    } on DioException {
      rethrow;
    } finally {
      _isFetching = false;
    }
  }

  void updateItems(List<T> newItems) {
    _items = [..._items, ...newItems];
    notifyListeners();
  }

  void resetItems() {
    _items = [];
    _currentPage = 0;
    _pageSize = 10;
    notifyListeners();
  }
}
