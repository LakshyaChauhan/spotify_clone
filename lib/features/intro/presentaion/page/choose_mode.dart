import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/features/auth/presentation/pages/signup_signin.dart';
import '../../../../common/widgets/buttons/basic_appbutton.dart';
import '../../../../core/configs/assets/app_images.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../bloc/intro_bloc.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBG),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      AppVectors.logo,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Choose Mode',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<IntroBloc>()
                                  .add(ChooseModeDarkClickedEvent());
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: 80.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff30393C)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    AppVectors.moon,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(width: 40.w),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<IntroBloc>()
                                  .add(ChooseModeLightClickedEvent());
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: 80.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff30393C)
                                          .withOpacity(0.5),
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    AppVectors.sun,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          const Text(
                            'Light Mode',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  BlocListener<IntroBloc, IntroState>(
                    bloc: context.read<IntroBloc>(),
                    listenWhen: (previous, current) =>
                        current is ChooseModePageContinueButtonClickedState,
                    listener: (context, state) {
                      if (state is ChooseModePageContinueButtonClickedState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignupSigninPage()));
                      }
                    },
                    child: BasicAppbutton(
                      onPressed: () => context
                          .read<IntroBloc>()
                          .add(ChooseModePageContinueButtonClickedEvent()),
                      text: 'Continue',
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
