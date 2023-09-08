import 'package:dating_app/components/custom_button.dart';
import 'package:dating_app/components/custom_logins_bar.dart';
import 'package:dating_app/components/custom_text.dart';
import 'package:dating_app/components/custom_textfeild.dart';
import 'package:dating_app/providers/signin_provider.dart';
import 'package:dating_app/screens/auth/register_page.dart';
import 'package:dating_app/screens/auth/trouble_login_page.dart';
import 'package:dating_app/utils/navigater_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/heart2.png",
                              ),
                              Image.asset("assets/text.png")
                            ],
                          ),
                          Image.asset(
                            "assets/Frame.png",
                            cacheHeight: 321,
                            cacheWidth: 187,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomtextFeild(
                    hintText: "Login Email",
                    controller:
                        Provider.of<SigninProvider>(context).emailController),
                const SizedBox(height: 10),
                CustomtextFeild(
                  hintText: "Password",
                  controller:
                      Provider.of<SigninProvider>(context).passwordController,
                  isobscure: true,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: const Alignment(1, 0),
                  child: InkWell(
                    child: const CustomText("Trouble login?",
                        fontSize: 12, fontWeight: FontWeight.w700),
                    onTap: () {
                      //----navigate to trouble login page

                      NavigatePages.navigateTo(
                          context, const TroubleLoginPage());
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Consumer<SigninProvider>(
                  builder: (context, value, child) {
                    return CustomButton(
                        isLoading: value.isLoading,
                        onTap: () {
                          // user login function
                          value.signinUser(context);
                        },
                        buttonText: "Login");
                  },
                ),

                const SizedBox(height: 10),
                const CustomText(
                  "-------- or --------",
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(height: 10),
                //
                //---custom login option for social signin methords
                const CustomLoginOptionbar(),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    //---navigate to registerpage
                    NavigatePages.navigateTo(context, const RegisterPage());
                  },
                  child: const CustomText("Don’t have an account?",
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
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
