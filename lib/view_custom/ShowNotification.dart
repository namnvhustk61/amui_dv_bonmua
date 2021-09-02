import 'package:flutter/material.dart';

class ShowNotification {
  static void showToast(BuildContext context, String? title, Color color) async {
    if (context == null){
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(title??"error"), backgroundColor: color,));
  }
}
