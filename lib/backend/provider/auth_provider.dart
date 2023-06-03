import 'package:flutter/material.dart';
import '../models/user_models.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({required int nim, required String password}) async {
    try {
      UserModel user = await AuthService().login(
        nim: nim,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
