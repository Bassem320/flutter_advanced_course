import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_exp_flut/core/theming/color.dart';

import 'font_weigh_helper.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.gray,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.gray,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.lightGray,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font13BlueSemibold = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
}
