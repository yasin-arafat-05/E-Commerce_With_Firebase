import 'package:eapp/constants/asset_images.dart';
import 'package:eapp/widgets/primary_buttion/primary_buttion.dart';
import 'package:eapp/widgets/top_title/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              subtitile: "To our YAKULU e-commerce app",
            ),
            //-------------------------WelcomeImage----------------------
            Center(
              child: Image.asset(
                AssectImages.instance.welcomeImage,
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
            //-------------------------LogIN Button----------------------
            const SizedBox(
              height: 20,
            ),
            PrimaryButtion(
              title: "Login",
              onPressed: () {},
            ),
            //-------------------------LogIN Button----------------------
            const SizedBox(
              height: 20,
            ),
            PrimaryButtion(
              title: "Sing Up",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
