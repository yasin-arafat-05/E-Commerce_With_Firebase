import 'package:flutter/material.dart';

class PrimaryButtion extends StatelessWidget {
  //decleare a final empty funciton.
  final void Function()? onPressed;
  final String? title;
  //consturctor
  const PrimaryButtion({super.key, this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,

        //null sefty! title!
        child: Text(title!),
      ),
    );
  }
}
