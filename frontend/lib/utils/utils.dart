import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red);
  }

  static showTopFlushbar(
      {required String title,
      required String message,
      required BuildContext context}) {
    Flushbar(
      backgroundColor: Colors.red,
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
