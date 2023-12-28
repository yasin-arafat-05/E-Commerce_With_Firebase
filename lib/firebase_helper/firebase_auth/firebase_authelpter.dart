// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eapp/constants/constants.dart';

class FirebaseAuthHelper {
  /*
     For fire base authentication 
     _auth -> other class can't use this instance
     Here Future is a class.
  */

  final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  /*
  In Dart, a Future is a way to represent a value or error that
  might be available in the future. 
  Dart uses the async and await keywords to work with asynchronous operations.
  */
  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessge(getMessageFromErrorCode(e.code.toString()));
      return false;
    }
  }

  // Future for signUp
  Future<bool> signUp(
      BuildContext context, String email, String password) async {
    try {
      showAboutDialog(context: context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      showMessge(e.code.toString());
      return false;
    }
  }
}
