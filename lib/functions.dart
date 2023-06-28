import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double sizeOfHeight(BuildContext context, double i) {
  return MediaQuery.of(context).size.height * i;
}

double sizeOfWidth(BuildContext context, double i) {
  return MediaQuery.of(context).size.width * i;
}
