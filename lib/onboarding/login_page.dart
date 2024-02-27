import 'package:flutter/material.dart';
import 'package:practice/onboarding/login_items.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            getStarted(),
          ],
        ),
      ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.pink,
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
        onPressed: () {},
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
