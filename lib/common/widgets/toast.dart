import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 4,
    fontSize: 16,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}


void showMessage({
  required BuildContext context,
  required String text,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  final snackBar = SnackBar(
    content: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    ),
    // backgroundColor: backgroundColor,
    duration: const Duration(seconds: 20),
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
