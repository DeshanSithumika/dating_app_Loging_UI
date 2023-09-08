import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dating_app/utils/allert_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SigninProvider extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();

  TextEditingController get emailController => _email;
//-----email getter
  final TextEditingController _password = TextEditingController();

  TextEditingController get passwordController => _password;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _resetEmail.dispose();
  }

//---loader function
  bool _isLoading = false;
  //---loading getter
  bool get isLoading => _isLoading;
  //---set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

//---=====signin method
  Future<void> signinUser(BuildContext context) async {
    try {
      setLoader = true;
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      setLoader = false;
      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      setLoader = false;
      if (e.code == 'user-not-found') {
        AllertHelper.showAllert(context, "user-not-found",
            "'No user found for that email.'", DialogType.error);
      } else if (e.code == 'wrong-password') {
        AllertHelper.showAllert(context, "wrong-password",
            "'Wrong password provided for that user.'", DialogType.error);
      }
    }
  }

  //forgot password stater
  final _resetEmail = TextEditingController();

  TextEditingController get resetEmail => _resetEmail;

  Future<void> sendResetEmail(BuildContext context) async {
    if (_resetEmail.text.isNotEmpty) {
      setLoader = true;
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _resetEmail.text)
          .then((value) => AllertHelper.showAllert(context, "Success",
              "plase check your email", DialogType.success));
      setLoader = false;
    } else {
      setLoader = false;
      AllertHelper.showAllert(context, 'Invalid Inputs',
          'Use Valid email............', DialogType.error);

      Logger().e("Invalid inputs");
    }
  }
}
