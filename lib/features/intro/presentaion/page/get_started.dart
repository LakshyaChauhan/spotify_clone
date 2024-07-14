import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_appbutton.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBG),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      AppVectors.logo,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  BasicAppbutton(
                    onPressed: () {},
                    text: 'Get Started',
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
          )
        ],
      ),
    );
  }
}
