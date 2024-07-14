import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/features/intro/presentaion/page/get_started.dart';
import 'package:spotify_clone/features/splash/presentaion/bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(MoveToAnotherScreenEvent());
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: context.read<SplashBloc>(),
        listenWhen: (previous, current) => current is SplashActionableState,
        listener: (context, state) {
          if (state is MoveToAnotherScreenState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const GetStartedPage()));
          }
        },
        child: Center(
          // child:SvgPicture.asset() ,
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
    );
  }
}
