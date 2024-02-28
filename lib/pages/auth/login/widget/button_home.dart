// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:practice/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonHome extends StatefulWidget {
  final TextEditingController userNameController;

  const ButtonHome({super.key, required this.userNameController});

  @override
  State<ButtonHome> createState() => _ButtonHomeState();
}

class _ButtonHomeState extends State<ButtonHome> {
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.pink,
      ),
      width: MediaQuery.of(context).size.width * .9,
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
          "Get Started",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
