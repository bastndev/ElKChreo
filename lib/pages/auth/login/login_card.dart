import 'package:flutter/material.dart';
import 'package:practice/core/themes/colors/my_color.dart';
import 'package:practice/pages/auth/login/widget/input_name_widget.dart';
import 'package:practice/pages/auth/login/widget/login_button_widget.dart';
import 'package:practice/pages/auth/login/widget/optional_widget.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  TextEditingController userNameController = TextEditingController();

  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MyColor.card,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido',
                style: TextStyle(
                  color: MyColor.title,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(controller: userNameController),
              const SizedBox(height: 20),
              LoginButton(userNameController: userNameController),
              const SizedBox(height: 23),
              const OptionalWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
