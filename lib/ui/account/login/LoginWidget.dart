
import 'package:dichvubonmua/res/colors.dart';
import 'package:dichvubonmua/res/dimens.dart';
import 'package:dichvubonmua/res/drawable.dart';
import 'package:dichvubonmua/res/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget buildEmailTF(TextEditingController emailController) {
  return Column(
    children: <Widget>[
      Container(
        child: Row(children: [
          Expanded(child: TextField(
            controller: emailController,
              decoration: InputDecoration(
                labelText: AppStrings.account,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                isDense: true,
              ),
              style: TextStyle(
                fontSize: AppDimens.sp_textTitle_big,
              )
          ),),
          SvgPicture.asset(
            AppDrawable.ic_lg_user_svg,
            height: AppDimens.dp_size_icon_20,
            width: AppDimens.dp_size_icon_20,
              color: AppColor.Gray,
          ),
        ],),
      ),
      Container(height: AppDimens.dp_line, width: double.infinity, color: AppColor.whiteGray,),
    ],
  );
}

Widget buildPasswordTF(TextEditingController passwordController) {
  return Column(
    children: <Widget>[
      Container(
        child: Row(children: [
          Expanded(child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(

                labelText: AppStrings.password,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                isDense: true,
              ),
              style: TextStyle(

                fontSize: AppDimens.sp_textTitle_big,
              )
          ),),
          SvgPicture.asset(
            AppDrawable.ic_password_svg,
            height: AppDimens.dp_size_icon_20,
            width: AppDimens.dp_size_icon_20,
            color: AppColor.Gray,
          ),
        ],),
      ),
      Container(height: AppDimens.dp_line, width: double.infinity, color: AppColor.whiteGray,),
    ],
  );
}

Widget buildForgotPasswordBtn(BuildContext context) {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      onPressed: () {
        print('Forgot Password Button Pressed');
        Navigator.pushNamed(context, 'login/forgot');
      },
      padding: EdgeInsets.only(right: 0.0),
      child: Text(
        'Quên mật khẩu?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

snackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}


Widget buildSignInWithText() {
  return Column(
    children: <Widget>[
      SizedBox(height: 4.0),
      Text(
        '- HOẶC -',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Đăng nhập với',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ],
  );
}

Widget buildSocialBtn(GestureTapCallback onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 56.0,
      width: 56.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}

Widget buildSignupBtn(BuildContext context) {
  return GestureDetector(
    onTap: () => print('Sign Up Button Pressed'),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Bạn chưa có tài khoản? ',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' Đăng ký ',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, 'login/registration');
              },
          ),
        ],
      ),
    ),
  );
}