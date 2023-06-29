import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

double sizeOfHeight(BuildContext context, double i) {
  return MediaQuery.of(context).size.height * i;
}

double sizeOfWidth(BuildContext context, double i) {
  return MediaQuery.of(context).size.width * i;
}

void showToast(String str) {
  Fluttertoast.showToast(
    msg: str,
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.white,
  );
}
