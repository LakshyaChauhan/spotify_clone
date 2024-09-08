import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/appbar/basic_appbar.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_appbutton.dart';
import 'package:spotify_clone/features/auth/signin/data/models/signin_user_request.dart';
import 'package:spotify_clone/features/auth/signin/domain/usecases/signin_usecase.dart';
import 'package:spotify_clone/features/auth/signin/presentation/pages/register_page.dart';
import 'package:spotify_clone/features/root/presentation/pages/root_page.dart';

import '../../../../../core/configs/assets/app_vectors.dart';
import '../../../../../service_locator.dart';

class SinginPage extends StatefulWidget {
  const SinginPage({super.key});

  @override
  State<SinginPage> createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _sigUpText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signInText(),
              const SizedBox(height: 30),
              _fullNameText(context),
              const SizedBox(height: 20),
              _passwordText(context),
              const SizedBox(height: 20),
              BasicAppbutton(
                  onPressed: () async {
                    var result = await sl<SigninUsecase>().call(
                        params: SigninUserRequest(
                            email: _emailController.text,
                            password: _passwordController.text));
        
                    result.fold((left) {
                      var snackbar = SnackBar(
                        content: Text(left),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }, (right) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const RootPage()),
                        (route) => false,
                      );
                    });
                  },
                  text: 'Sign In')
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameText(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordText(BuildContext context) {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _sigUpText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(text: 'Not a member. ', children: [
              WidgetSpan(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegisterPage()));
                      },
                      child: const Text('Sign Up',
                          style: TextStyle(color: Colors.blue)))),
            ]),
          ),
        ],
      ),
    );
  }
}
