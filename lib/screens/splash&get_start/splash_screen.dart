import 'package:dating_app/contrallers/auth_contraller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        // NavigatePages.navigateTo(context, const GetStart());
        AuthController.authState(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset("assets/splash.png")),
          Center(child: Image.asset("assets/Ell.png")),
          Center(child: Image.asset('assets/heart.png')),
          const Padding(
            padding: EdgeInsets.only(top: 550, left: 90),
            child: Text(
              'Find Your Soulmate',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
