import 'package:dating_app/components/custom_button.dart';
import 'package:dating_app/components/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10),
            width: 300,
            height: 300,
            decoration: const BoxDecoration(color: Colors.amber),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText("This is home page"),
                const SizedBox(height: 30),
                CustomButton(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Logger().i("singout");
                    },
                    buttonText: "LogOut")
              ],
            ))),
      ),
    );
  }
}
