import 'package:flutter/material.dart';

class NavigatePages {
  static void navigateTo(BuildContext context, Widget widget) {
    //---navigate to page
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  static void goBack(BuildContext context, Widget widget) {
    //---navigate to page
    Navigator.of(context).pop();
  }
}
