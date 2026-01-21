import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 3,
      gravity: ToastGravity.TOP,
    );
  }

  void flushbarMessage(String msg, BuildContext context) {
    Flushbar(
      message: msg,
      backgroundColor: Colors.red,
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      duration: Duration(seconds: 3),
    ).show(context);
  }

  void snackBarMessage(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
