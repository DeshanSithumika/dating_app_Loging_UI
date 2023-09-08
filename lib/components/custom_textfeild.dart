import 'package:flutter/material.dart';

class CustomtextFeild extends StatelessWidget {
  const CustomtextFeild({
    Key? key,
    required this.hintText,
    this.isobscure = false,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final bool isobscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      controller: controller,
      obscureText: isobscure,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          )),
    );
  }
}
