import 'package:dating_app/components/custom_button.dart';
import 'package:dating_app/components/custom_text.dart';
import 'package:dating_app/components/custom_textFeild.dart';
import 'package:dating_app/providers/signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TroubleLoginPage extends StatefulWidget {
  const TroubleLoginPage({super.key});

  @override
  State<TroubleLoginPage> createState() => _TroubleLoginPageState();
}

class _TroubleLoginPageState extends State<TroubleLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset("assets/forgot_password.png"),
                  const SizedBox(height: 50),
                  const CustomText("Trouble Log In?"),
                  const SizedBox(height: 20),
                  CustomtextFeild(
                      hintText: "Enter your Email",
                      controller:
                          Provider.of<SigninProvider>(context).resetEmail),
                  const SizedBox(height: 15),
                  Consumer<SigninProvider>(
                    builder: (context, value, child) {
                      return CustomButton(
                          isLoading: value.isLoading,
                          onTap: () {
                            //function here
                            value.sendResetEmail(context);
                          },
                          buttonText: "Send Reset Email");
                    },
                  ),
                  const SizedBox(height: 150),
                  const CustomText(
                    "By continue to login, you accept our company’s \n       Term & conditions and Privacy policies.",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
