// ignore_for_file: use_build_context_synchronously

import 'package:eapp/constants/constants.dart';
import 'package:eapp/constants/routes.dart';
import 'package:eapp/firebase_helper/firebase_auth/firebase_authelpter.dart';
import 'package:eapp/screens/auth_ui/sign_up/sign_up.dart';
import 'package:eapp/screens/home/home.dart';
import 'package:eapp/widgets/primary_buttion/primary_buttion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eapp/widgets/top_title/top_titles.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isShowPassword = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //In Flutter, the Scaffold widget is a fundamental
    //and highly important widget for building the structure of an app's user interface.
    return Scaffold(
      //When keyboard will appear it will touch some my widges and that give me 
      // overflow error to solve this we use resizeToAvoidBottomInset.
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------giving title and sub-titles from lib/widgets/top_title--------
            const TopTitles(
              title: "Login",
              subtitile: "Welcome back to Blink",
            ),
            const SizedBox(
              height: 30,
            ),
            //--------------------------Text Form Field------------------------
            //--------------For E-mail----------------
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "E-mail",
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            //--------------For Password----------------
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _password,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(
                  Icons.password_outlined,
                ),
                suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  child: Icon(
                    isShowPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            //--------------------------Submit Button Field------------------------
            const SizedBox(
              height: 20,
            ),
            PrimaryButtion(
              title: "Submit",
              onPressed: () async {
                bool isValided = loginValidation(_email.text, _password.text);
                if (isValided) {
                  bool isLogin = await FirebaseAuthHelper.instance
                      .login(_email.text, _password.text, context);
                  if (isLogin) {
                    Routes.instance.pushAndRemoveUntill(const Home(), context);
                  }
                }
              },
            ),
            //--------------------------don't have an account or bla bla-----------
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text("Don't have an account?"),
            ),
            Center(
              child: CupertinoButton(
                onPressed: () {
                  Routes.instance.pushAndRemoveUntill(const SignUp(), context);
                },
                child: const Text("Create an account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
