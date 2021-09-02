import 'package:dichvubonmua/res/colors.dart';
import 'package:dichvubonmua/res/dimens.dart';
import 'package:dichvubonmua/res/drawable.dart';
import 'package:dichvubonmua/res/strings.dart';
import 'package:dichvubonmua/view_custom/BaseView.dart';
import 'package:dichvubonmua/view_custom/RoundedButtonWidget.dart';
import 'package:dichvubonmua/view_custom/ShowNotification.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


import 'LoginBloc.dart';
import 'LoginDelegate.dart';
import 'LoginWidget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {

  BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidget createState() => _BodyWidget();
}

class _BodyWidget extends State<BodyWidget> implements LoginDelegate {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

   LoginBloc? _loginBloc;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {});
    passwordController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loginBloc == null) {
      _loginBloc = Provider.of<LoginBloc>(context);
      _loginBloc?.setDelegate(this);
    }

    print('---------- Build login view ----------');
    return Stack(
      children: <Widget>[
        BaseView(
          child: Container(
            height: double.maxFinite,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/16, right: MediaQuery.of(context).size.width/16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(children: [
                    Container(
                      child: Image.asset(
                        AppDrawable.ic_splash_png,
                        width: MediaQuery.of(context).size.width/2,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/8,
                    ),

                    buildEmailTF(phoneController),
                    SizedBox(
                      height:MediaQuery.of(context).size.height/24,
                    ),
                    buildPasswordTF(passwordController),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/6,
                    ),
                    RoundedButtonWidget(
                      onpressed: () {
                        FocusScope.of(context).unfocus();
                        _loginBloc?.login(phoneController.text, passwordController.text);
                      },
                      width:  MediaQuery.of(context).size.width,
                    buttonText: AppStrings.login,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height/48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Don't have an Account?",
                        style: TextStyle(
                            fontSize: AppDimens.sp_textNormal,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Roboto'),),

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'login/register');
                        },
                        splashColor: AppColor.splashColor,
                        child: Text(" Sign Up", style: TextStyle(
                            color: AppColor.primaryColorStart,
                            fontSize: AppDimens.sp_textTitle,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto'),
                        ),
                      ),
                    ],),
                    SizedBox(
                      height:MediaQuery.of(context).size.height/48,
                    ),
                    InkWell(
                      onTap: () {

                      },
                      splashColor: AppColor.splashColor,
                      child: Text(" Forgot Password ", style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColor.primaryColorEnd,
                          fontSize: AppDimens.sp_textTitle,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto'),
                      ),
                    ),
                  ],),

                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.width/8,
          left:  -MediaQuery.of(context).size.width/8,
          child:  Image.asset(
          AppDrawable.ic_bg_top_png,
          height: MediaQuery.of(context).size.width/4,
          width: MediaQuery.of(context).size.width/3,

        ),)
        ,Positioned(
          // bottom: -MediaQuery.of(context).size.width/8,
          right:  -MediaQuery.of(context).size.width/8,
          child:  Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.94),
            child: Image.asset(
              AppDrawable.ic_bg_top_png,
              height: MediaQuery.of(context).size.width/4,
              width: MediaQuery.of(context).size.width/3,

            ),
          ),),
      ],
    );
  }

  @override
  void onError(String message) {
    ShowNotification.showToast(context, message, AppColor.clError);
  }

  @override
  void onLoginSuccess(String message) {
    ShowNotification.showToast(context, message, AppColor.clSuccess);
    Navigator.pushNamed(context, 'home');
  }
}
