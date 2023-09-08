import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AllertHelper {
//---show allert methode
  static Future<void> showAllert(
      BuildContext context, String title, String desc, DialogType type) async {
    AwesomeDialog(
      context: context,
      dialogType: type,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
