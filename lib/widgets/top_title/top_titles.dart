import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitile;
  const TopTitles({super.key, required this.title, required this.subtitile});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight,
        ),

        //-------------------------For back button----------------------
        /*
        For padding issue we use GestureDector insead of 
        IconButtion,BackButton(),
        In GestureDector we need to specify the portion where the gesture
        will apply for example here we use Icon.arrow_back_ios
        */
        if (title == "Login" || title == "Create Account")
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        const SizedBox(
          height: 12,
        ),
        //-------------------------Title----------------------
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        //-------------------------Sub Title----------------------
        Text(
          subtitile,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
