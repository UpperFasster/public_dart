import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/core/services/services.dart';
import 'package:food_court/core/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStateService extends ChangeNotifier {
  bool _isNotInited = true;
  UserDTO? _user;

  UserDTO? get user => _user;
  bool get isNotInited => _isNotInited;

  void initUser() {
    String? data = getIt.get<SharedPreferences>().getString(
          KeysOfSharedPreferences.userInf,
        );
    log('Dat: $data');
    if (data != null) {
      _user = UserDTO.fromJson(jsonDecode(data));
    } else {
      _user = null;
    }
    _isNotInited = false;
    notifyListeners();
  }

  void updateUser(UserDTO userDTO) {
    _user = userDTO;
    final sp = getIt.get<SharedPreferences>();
    sp.setString(
      KeysOfSharedPreferences.userInf,
      jsonEncode(userDTO.toJson()),
    );
    notifyListeners();
  }

  void logoutUser() {
    _user = null;
    getIt.get<SharedPreferences>().clear();
    notifyListeners();
  }
}
