import 'package:flutter/material.dart';
import 'package:practice/app_bar.dart';
// import 'package:practice/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.getString("userName") ?? "";
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  /// is a property of Scaffold widget. It is used to set the body `body` of the Scaffold. It takes a widget as a parameter.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      // appBar: const AppBarPe(key: Key('AppBarPe')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(userName),
        ],
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
