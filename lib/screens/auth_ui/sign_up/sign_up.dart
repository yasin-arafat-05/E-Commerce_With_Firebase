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
  var changeIcon = const Icon(Icons.visibility_off);

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
                obscureText: showPass,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                  ),
                  suffixIcon: CupertinoButton(
                    child: changeIcon,
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                        if (showPass) {
                          changeIcon = const Icon(Icons.visibility);
                        } else {
                          changeIcon = const Icon(Icons.visibility_off);
                        }
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //-----------------------Submit Button ---------------------
              PrimaryButtion(
                title: "Submit",
                onPressed: () {},
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
