import 'package:dating_app/components/custom_button.dart';
import 'package:dating_app/components/custom_logins_bar.dart';
import 'package:dating_app/components/custom_text.dart';
import 'package:dating_app/components/custom_textFeild.dart';
import 'package:dating_app/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/registerpage.png"),
                const SizedBox(height: 10),
                const CustomText("Register Here"),
                const SizedBox(height: 30),
                CustomtextFeild(
                    hintText: "Enter Your Email",
                    controller:
                        Provider.of<SignupProvider>(context).emailController),
                const SizedBox(height: 20),
                CustomtextFeild(
                    hintText: "Enter your mobile number",
                    controller: Provider.of<SignupProvider>(context)
                        .phoneNumberController),
                const SizedBox(height: 20),
                CustomtextFeild(
                    hintText: "Enter your Password",
                    controller:
                        Provider.of<SignupProvider>(context).passwordController,
                    isobscure: true),
                const SizedBox(height: 30),
                Consumer<SignupProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                      isLoading: value.isLoading,
                      onTap: () {
                        value.signupUser(context);
                      },
                      buttonText: "Register",
                    );
                  },
                ),
                const CustomText(
                  "--------or-------",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 10),
                const CustomLoginOptionbar(),
                const SizedBox(height: 10),
                const CustomText(
                  "By continue to login, you accept our company’s \n       Term & conditions and Privacy policies.",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
