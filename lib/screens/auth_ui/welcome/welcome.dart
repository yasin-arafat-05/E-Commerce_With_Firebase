import 'package:eapp/constants/asset_images.dart';
import 'package:eapp/screens/auth_ui/login/login.dart';
import 'package:eapp/screens/auth_ui/sign_up/sign_up.dart';
import 'package:eapp/widgets/primary_buttion/primary_buttion.dart';
import 'package:eapp/widgets/top_title/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eapp/constants/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-------------------------Title and Subtitle----------------------
            const TopTitles(
              title: "Welcome",
              subtitile: "To our Blink e-commerce app",
            ),
            //-------------------------WelcomeImage----------------------
            Center(
              child: Image.asset(
                AssectImages.instance.blingLogo,
                width: 250.0,
                height: 350.0,
              ),
            ),
            //-------------------------Icon----------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(0),
                  child: const Icon(
                    Icons.facebook,
                    size: 35,
                    color: Colors.blueAccent,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(
                    AssectImages.instance.googleLogo,
                    scale: 11.0,
                  ),
                ),
              ],
            ),
            //-------------------------Log in  Button----------------------
            const SizedBox(
              height: 20,
            ),
            PrimaryButtion(
              title: "Login",
              onPressed: () {
                Routes.instance.push(const LogIn(), context);
              },
            ),
            //-------------------------Sign Up Button----------------------
            const SizedBox(
              height: 20,
            ),
            PrimaryButtion(
              title: "Sing Up",
              onPressed: () {
                Routes.instance.push(const SignUp(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
