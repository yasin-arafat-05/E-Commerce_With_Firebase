import 'package:flutter/material.dart';
import 'package:eapp/widgets/top_title/top_titles.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    //In Flutter, the Scaffold widget is a fundamental
    //and highly important widget for building the structure of an app's user interface.

    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            //giving title and sub-titles from lib/widgets/top_title
            TopTitles(
              title: "Login",
              subtitile: "Welcome back to Yaistore",
            ),
          ],
        ),
      ),
    );
  }
}
