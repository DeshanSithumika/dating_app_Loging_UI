import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dating_app/utils/allert_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignupProvider extends ChangeNotifier {
  //---email contraller
  final TextEditingController _email = TextEditingController();

  TextEditingController get emailController => _email;

  //--getter

  final TextEditingController _phoneNumber = TextEditingController();

  TextEditingController get phoneNumberController => _phoneNumber;

  final TextEditingController _password = TextEditingController();

  TextEditingController get passwordController => _password;

  //----======loading stater
  bool _isLoading = false;
  //---loading getter
  bool get isLoading => _isLoading;
  //---set loading state
  set setLoader(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //------==============signup function

  Future<void> signupUser(BuildContext context) async {
    try {
      setLoader = true;
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      setLoader = false;

      Logger().i(credential.user);
    } on FirebaseAuthException catch (e) {
      setLoader = false;
      if (e.code == 'weak-password') {
        Logger().e(AllertHelper.showAllert(context, "Validation Error",
            "The password provided is too weak.", DialogType.error));
      } else if (e.code == 'email-already-in-use') {
        Logger().e(AllertHelper.showAllert(context, "Validation Error",
            "The account already exists for that email.", DialogType.error));
      }
    } catch (e) {
      setLoader = false;
      AllertHelper.showAllert(
          context, "Validation Error", "Fill all the feilds", DialogType.error);
      Logger().e(e);
    }
  }
}
