import 'package:dichvubonmua/http/Api.dart';
import 'package:dichvubonmua/res/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'LoginDelegate.dart';

class LoginBloc extends ChangeNotifier {
  String userErr="";
  String passErr="";
  bool btnLoginShow = false;

  LoginDelegate? _delegate;

  LoginBloc();

  @override
  void dispose() {
    super.dispose();
  }

  void setDelegate(LoginDelegate delegate){
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
