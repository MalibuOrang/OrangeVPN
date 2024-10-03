import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs {
  static success({required String msg}) {
    Get.snackbar(
      'Succes',
      msg,
      // ignore: deprecated_member_use
      colorText: Colors.greenAccent.withOpacity(0.9),
    );
  }

  static error({required String msg}) {
    Get.snackbar(
      'Error',
      msg,
      // ignore: deprecated_member_use
      colorText: Colors.redAccent.withOpacity(0.9),
    );
  }

  static info({required String msg}) {
    Get.snackbar('Info', msg, colorText: Colors.white);
  }

  static showProgress() {
    Get.dialog(Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    ));
  }
}
