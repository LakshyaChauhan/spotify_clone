import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/configs/theme/app_theme.dart';
import 'package:spotify_clone/features/splash/presentaion/bloc/splash_bloc.dart';
import 'package:spotify_clone/features/splash/presentaion/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 849),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashBloc()),
        ],
        child: MaterialApp(
          title: 'Spotify Clone',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
