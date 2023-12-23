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
  var changeIcon = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    //In Flutter, the Scaffold widget is a fundamental
    //and highly important widget for building the structure of an app's user interface.
    return Scaffold(
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
                      if (isShowPassword) {
                        changeIcon = const Icon(Icons.visibility);
                      } else {
                        changeIcon = const Icon(Icons.visibility_off);
                      }
                    });
                  },
                  child: changeIcon,
                ),
              ),
            ),
            //--------------------------Submit Button Field------------------------
            const SizedBox(
              height: 20,
            ),
            PrimaryButtion(
              title: "Submit",
              onPressed: () {},
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
                onPressed: () {},
                child: const Text("Create an account"),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
