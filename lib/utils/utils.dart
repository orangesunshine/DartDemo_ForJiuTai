import 'package:flutter/material.dart';
import 'package:flutter_jiutai/constance/constance.dart';
import 'package:fluttertoast/fluttertoast.dart';

void back(BuildContext context) {
  Navigator.pop(context);
}

void toastError(String err) {
  Fluttertoast.showToast(
      msg: err,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colores.light_gray,
      textColor: Colores.red);
}

void toastMsg(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colores.light_gray,
      textColor: Colores.black);
}
