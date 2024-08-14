import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_appbutton.dart';
import 'package:spotify_clone/features/auth/signin/presentation/pages/singin_page.dart';

import '../../../../../common/appbar/basic_appbar.dart';
import '../../../../../core/configs/assets/app_vectors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 30),
            _fullNameText(context),
            const SizedBox(height: 20),
            _userNameText(context),
            const SizedBox(height: 20),
            _passwordText(context),
            const SizedBox(height: 20),
            BasicAppbutton(
              onPressed: () {},
              text: 'Create Account',
            )
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign Up',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameText(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _userNameText(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Username')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordText(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _siginText(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(text: 'Do you have an account ? ', children: [
              WidgetSpan(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SinginPage()));
                      },
                      child: const Text('Sign In',
                          style: TextStyle(color: Colors.blue)))),
            ]),
          ),
        ],
      ),
    );
  }
}
