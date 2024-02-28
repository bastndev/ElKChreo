import 'package:flutter/material.dart';
import 'package:practice/pages/auth/login/card_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image(
                  image: const AssetImage('assets/images/logo.png'),
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ),
              const SizedBox(height: 95),
              const Expanded(
                child: LoginCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
