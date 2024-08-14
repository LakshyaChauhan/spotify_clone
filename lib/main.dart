import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_clone/core/configs/theme/app_theme.dart';
import 'package:spotify_clone/core/configs/theme/bloc/theme_bloc.dart';
import 'package:spotify_clone/features/intro/presentaion/bloc/intro_bloc.dart';
import 'package:spotify_clone/features/splash/presentaion/bloc/splash_bloc.dart';
import 'package:spotify_clone/features/splash/presentaion/pages/splash_page.dart';
import 'package:spotify_clone/firebase_options.dart';
import 'package:spotify_clone/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initalizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
        BlocProvider<IntroBloc>(create: (context) => IntroBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LightThemeModeState || state is DarkThemeModeState) {
            return ScreenUtilInit(
                designSize: const Size(390.0, 849.0),
                builder: (context, child) {
                  return MaterialApp(
                    title: 'Spotify Clone',
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    themeMode: state.themeMode,
                    home: const SplashPage(),
                  );
                });
          }
          return ScreenUtilInit(
              designSize: const Size(390.0, 849.0),
              builder: (context, child) {
                return MaterialApp(
                  title: 'Spotify Clone',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: ThemeMode.system,
                  home: const SplashPage(),
                );
              });
        },
      ),
    );
  }
}
