import 'package:flutter/material.dart';

class AppNavigation {

  static comeBackToFirstScreen(BuildContext context){
    while(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }

  static backMultiStack(BuildContext context, int turns){
    for(int i = 0; i<turns; i++){
      Navigator.of(context).pop();
    }
  }
}
