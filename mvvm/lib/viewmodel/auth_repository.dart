import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/api_authentication.dart';
import 'package:mvvm/utils/Utils.dart';

class AuthRepository with ChangeNotifier {
  bool loading = false;

  bool get loadingValue => loading;

  dynamic response;

  final auth = Authentication();

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<dynamic> getloginApi(
    String url,
    dynamic data,
    BuildContext context,
  ) async {
    setLoading(true);
    try {
      response = await auth.loginApi(url, data).whenComplete(() {
        setLoading(false);
        Utils().flushbarMessage('Login Successful', context);
      });
    } catch (e) {
      setLoading(false);
      // throw FetchDataException(e.toString());
      // print(e.toString());
      Utils().flushbarMessage(e.toString(), context);
    }
    notifyListeners();
    return response;
  }

  Future<dynamic> getsignUpApi(String url, dynamic data) async {
    setLoading(true);
    try {
      response = await auth.signUpApi(url, data);
      if (response != null) {
        setLoading(false);
      } else {}
    } catch (e) {
      setLoading(false);
      // throw FetchDataException(e.toString());
      print(e.toString());
    }
    notifyListeners();
    return response;
  }
}
