import 'package:dating_app/components/custom_button.dart';
import 'package:dating_app/components/custom_text.dart';
import 'package:dating_app/screens/auth/login_page.dart';
import 'package:dating_app/utils/navigater_page.dart';
import 'package:flutter/material.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/get.png'),
            const SizedBox(height: 36),
            //using custom text feild
            const CustomText("Let's get closer",
                fontSize: 15, fontWeight: FontWeight.w500),
            const SizedBox(height: 15),
            const CustomText("The best place to meet your future partner."),
            const SizedBox(height: 36),

            //use custom button
            CustomButton(
                onTap: () {
                  // ---navigate function

                  NavigatePages.navigateTo(context, const LoginPage());
                },
                buttonText: "Get Started"),
          ],
        ),
      ),
    );
  }
}
