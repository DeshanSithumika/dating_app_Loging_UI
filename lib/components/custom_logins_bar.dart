import 'package:flutter/material.dart';

class CustomLoginOptionbar extends StatelessWidget {
  const CustomLoginOptionbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            // AuthController.signInWithGoogle();
          },
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset("assets/google.png"),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset("assets/facebook.png"),
          ),
        )
      ],
    );
  }
}
