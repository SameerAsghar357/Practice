import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel with ChangeNotifier {
  String token = '';

  String get getToken => token;

  Future<bool> setUser(String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', value);
    return true;
  }

  Future<String> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') ?? '';
    notifyListeners();
    return token;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final isRemoved = sp.remove('token');
    sp.clear();
    return isRemoved;
  }
}
