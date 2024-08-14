import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/common/appbar/basic_appbar.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class BasicAppbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? height;
  final String text;
  final Color? textColor;
  const BasicAppbutton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.height,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 70.h)),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ??
                  Colors.white),
        ));
  }
}
