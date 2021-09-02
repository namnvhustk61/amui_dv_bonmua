import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';


class AppStyles{

  AppStyles._();

  ///// text
  static const roboto_black_h1_bold = TextStyle(
      color: Colors.black,
      fontSize: AppDimens.sp_textNormal,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto');

  static const roboto_black_h1_light = TextStyle(
      color: Colors.black,
      fontSize: AppDimens.sp_textNormal,
      fontStyle: FontStyle.normal,
      fontFamily: 'Roboto');

  static const svn_gliroy_black_h1_light = TextStyle(
      color: Colors.black,
      fontSize: AppDimens.sp_textNormal,
      fontFamily: 'SvnGliroy');

  static const svn_gliroy_black_h1_bold = TextStyle(
      color: Colors.black,
      fontSize: AppDimens.sp_textNormal,
      fontWeight: FontWeight.w700,
      fontFamily: 'SvnGliroy');


  /// hung
  static const textWhiteGreyH1 = TextStyle(
    color: AppColor.whiteGray,
      fontSize: AppDimens.sp_textMinium,
      fontFamily: 'SvnGliroy'
  );

  static const textBlackH0 = TextStyle(
    color: AppColor.black,
      fontSize: AppDimens.sp_textMinium,
      fontFamily: 'SvnGliroy'
  );
  static const textBoldBlackH0 = TextStyle(
    color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: AppDimens.sp_textMinium,
      fontFamily: 'SvnGliroy'
  );
  static const textBoldBlackH2 = TextStyle(
    color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: AppDimens.sp_textTitle,
      fontFamily: 'SvnGliroy'
  );
  static const textBoldBlackH1 = TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: AppDimens.sp_textNormal,
      fontFamily: 'SvnGliroy'
  );
  static const textBlackH2 = TextStyle(
      color: AppColor.black,
      fontSize: AppDimens.sp_textTitle,
      fontFamily: 'SvnGliroy'
  );
  static const textBlackH3 = TextStyle(
      color: AppColor.black,
      fontSize: AppDimens.sp_textTitle_big,
      fontFamily: 'SvnGliroy'
  );
  static const textBoldBlackH3 = TextStyle(
      color: AppColor.black,
      fontSize: AppDimens.sp_textTitle_big,
      fontFamily: 'SvnGliroy',
    fontWeight: FontWeight.bold,

  );
  static const textAppbar = TextStyle(
      color: AppColor.black,
      fontSize: AppDimens.sp_textActionBar,
      fontWeight: FontWeight.bold,
      fontFamily: 'SvnGliroy'
  );
}