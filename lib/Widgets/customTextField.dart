import 'package:flutter/material.dart';
import 'package:frontend/Utils/customColors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 2,
        )]
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
