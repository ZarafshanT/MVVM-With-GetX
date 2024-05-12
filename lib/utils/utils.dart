import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/res/constants/colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieledFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: blackColor,
        gravity: ToastGravity.BOTTOM);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: blackColor,
        gravity: ToastGravity.CENTER);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
