import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessge(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

//---------------------------------Alert----------------------------------------
/*
Certainly! This code defines a function named showLoaderDialog in Flutter
that creates and displays a custom loading dialog using the AlertDialog widget.
More search AlertDialog in flutter
*/

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text("Loading...")),
          ],
        ),
      );
    }),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//-------------------------------- error message Decoration --------------------------------
String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page.";
    case "account-exists-with-different-credential":
      return "Email already used. Go to login page.";
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Password ";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "user-not-found":
      return "No user found with this email.";
    case "ERROR_USER_DISABLED":
      return "User disabled.";
    case "user-disabled":
      return "User disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many requests to log into this account.";
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Too many requests to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid.";
    case "invalid-email":
      return "Email address is invalid.";
    default:
      return "Login failed. Please try again.";
  }
}

//-----------------------------Check the field is empty or not for LOGIN -------------------------
bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessge("Both Email and Password is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessge("Email is Empty");
    return false;
  } else if (email.isEmpty) {
    showMessge("Password is Empty");
    return false;
  } else {
    return true;
  }
}

//-----------------------------Check the field is empty or not SignUP-------------------------
bool signUpValidation(
    String name, String email, String phone, String password) {
  if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
    showMessge("Empty Field");
    return false;
  } else {
    return true;
  }
}
