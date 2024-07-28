import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class SignupSigninPage extends StatelessWidget {
  const SignupSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppVectors.logo),
              SizedBox(height: 55.h),
              Text('Enjoy Listening To Music',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      )),
    );
  }
}
