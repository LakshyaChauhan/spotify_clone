import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary,
    fontFamily: 'Satoshi',
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        )
      )
    )
  );

    static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primary,
    fontFamily: 'Satoshi',
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle:  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        )
      )
    )
  );
}
