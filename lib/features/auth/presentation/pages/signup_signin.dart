import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_appbutton.dart';
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
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                SizedBox(height: 55.h),
                Text('Enjoy Listening To Music',
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 21.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Spotify is properietary Sweadish audio Streaming and media services provider',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                        flex: 1,
                        child: BasicAppbutton(
                          onPressed: () {},
                          text: 'Register',
                          textColor: Colors.white,
                        )),
                    const SizedBox(width: 20),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'SignIn',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    const SizedBox(width: 20),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
