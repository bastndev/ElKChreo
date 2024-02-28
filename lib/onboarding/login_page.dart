import 'package:flutter/material.dart';
import 'package:practice/onboarding/login_items.dart';
import 'package:practice/widgets/button_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();

  final controller = LoginItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: controller.items.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.items[index].image),
                      const SizedBox(height: 20),
                      Text(controller.items[index].title),
                      Text(controller.items[index].description),
                    ],
                  );
                },
              ),
            ),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ButtonHome(userNameController: userNameController),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
