// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:practice/core/themes/colors/my_color.dart';
import 'package:practice/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController userNameController;

  const LoginButton({super.key, required this.userNameController});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: MyColor.mainButton,
      ),
      width: MediaQuery.of(context).size.width * .5,
      height: 55,
      child: TextButton(
        onPressed: () async {
          final pres = await SharedPreferences.getInstance();
          final sp = await SharedPreferences.getInstance();

          pres.setBool('onboarding', true);
          sp.setString("userName", widget.userNameController.text);

          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: const Text(
          "Iniciar Sesión",
          style: TextStyle(
            color: MyColor.text,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
