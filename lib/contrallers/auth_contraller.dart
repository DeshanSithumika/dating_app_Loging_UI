import 'package:dating_app/screens/home/home_screen.dart';
import 'package:dating_app/screens/splash&get_start/get_start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../utils/navigater_page.dart';

class AuthController {
  //--innitialize the user and listen to the auth state

  static Future<void> authState(BuildContext context) async {
    //---check user current state
    //---register this listner
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        //---if the user object is null--that means the user is signed out or not exists
        //---so send to the signup
        NavigatePages.navigateTo(context, const GetStart());
        Logger().i('User is currently signed out!');
      } else {
        //---if user is not null ---navigate to home page
        NavigatePages.navigateTo(context, const HomeScreen());
        Logger().i('User is signed in!');
      }
    });
  }

  //---singup user

  //---singin user
  static Future<void> singinUser(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
    }
  }

  // static Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
