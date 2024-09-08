import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_appbutton.dart';
import 'package:spotify_clone/features/auth/signin/data/models/create_user_request.dart';
import 'package:spotify_clone/features/auth/signin/domain/usecases/signup_usecase.dart';
import 'package:spotify_clone/features/auth/signin/presentation/pages/singin_page.dart';
import 'package:spotify_clone/features/root/presentation/pages/root_page.dart';
import 'package:spotify_clone/service_locator.dart';

import '../../../../../common/appbar/basic_appbar.dart';
import '../../../../../core/configs/assets/app_vectors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

   @override
 void dispose() {
  _usernameController.dispose();
   _emailController.dispose();
   _passwordController.dispose();
   super.dispose();
 }
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 30),
              _userNameText(context),
              const SizedBox(height: 20),
              _emailText(context),
              const SizedBox(height: 20),
              _passwordText(context),
              const SizedBox(height: 20),
              BasicAppbutton(
                onPressed: () async {
                  var result = await sl<SignupUsecase>().call(
                      params: CreateUserRequest(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                          fullName: _usernameController.text.toString()));
                  result.fold((ifLeft) {
                    var snackbar = SnackBar(
                        content: Text(ifLeft),
                        behavior: SnackBarBehavior.floating);
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (ifRight) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const RootPage()),
                      (route) => false,
                    );
                  });
                },
                text: 'Create Account',
              )
            ],
          ),
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

  Widget _emailText(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _userNameText(BuildContext context) {
    return TextField(
      controller: _usernameController,
      decoration: const InputDecoration(hintText: 'Username')
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
