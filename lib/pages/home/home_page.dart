import 'package:flutter/material.dart';
import 'package:practice/pages/home/widget/appbar_home.dart';
// import 'package:practice/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// is a property of Scaffold widget. It is used to set the body `body` of the Scaffold. It takes a widget as a parameter.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHomePage(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, Home Page 2'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('onboarding', false);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
