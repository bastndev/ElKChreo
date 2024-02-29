import 'package:flutter/material.dart';
import 'package:practice/core/themes/colors/my_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(
        color: MyColor.textBlack,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: "Nombre su negocio",
        hintStyle: const TextStyle(
          color: MyColor.optionalText,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
