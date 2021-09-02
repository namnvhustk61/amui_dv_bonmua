import 'package:dichvubonmua/http/Api.dart';
import 'package:dichvubonmua/res/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'RegisterDelegate.dart';

class RegisterBloc extends ChangeNotifier {
  String userErr="";
  String passErr="";
  bool btnLoginShow = false;

  RegisterDelegate? _delegate;

  RegisterBloc();

  @override
  void dispose() {
    super.dispose();
  }

  void setDelegate(RegisterDelegate delegate){
    if(_delegate == null){
      _delegate = delegate;
    }
  }

  void login(String user, String pass) async{
    if(!validateUserPassword(user, pass)){return;}

    _delegate?.onLoginSuccess("");
  }

   bool validateUserPassword(String user, String pass) {
    if (user.length == 0 || pass.length == 0) {
      _delegate?.onError(AppStrings.message_login_err_account_empty);
      return false;
    }
    return true;
  }

}
