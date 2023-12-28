// ignore_for_file: use_build_context_synchronously

import 'package:eapp/constants/constants.dart';
import 'package:eapp/firebase_helper/firebase_auth/firebase_authelpter.dart';
import 'package:eapp/screens/auth_ui/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eapp/widgets/top_title/top_titles.dart';
import 'package:eapp/widgets/primary_buttion/primary_buttion.dart';
import 'package:eapp/constants/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPass = true;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-----------------------Titles and Sub Titles---------------------
              const TopTitles(
                title: "Create Account",
                subtitile: "Welcome to Blink",
              ),
              const SizedBox(
                height: 30,
              ),
              //-----------------------Text Form Field -> Name ---------------------
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //-----------------------Text Form Field -> E-mail ---------------------
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //-----------------------Text Form Field -> Phone ---------------------
              TextFormField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Phone",
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //-----------------------Text Form Field -> Password ---------------------
              TextFormField(
                controller: _password,
                obscureText: showPass,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                  ),
                  suffixIcon: CupertinoButton(
                    child: Icon(
                      showPass ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //-----------------------Create an account ---------------------
              PrimaryButtion(
                title: "Create an account",
                onPressed: () async {
                  bool isValided = signUpValidation(
                      _name.text, _email.text, _phone.text, _password.text);
                  if (isValided) {
                    bool isLogIn = await FirebaseAuthHelper.instance
                        .signUp(context, _email.text, _password.text);
                    if (isLogIn) {
                      Routes.instance.push(const LogIn(), context);
                    }
                  }
                },
              ),
              //--------------------------don't have an account or bla bla-----------
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("Already have an account?"),
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Routes.instance.push(const LogIn(), context);
                  },
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
