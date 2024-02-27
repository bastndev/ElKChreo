import 'package:flutter/material.dart';
import 'package:practice/app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userName,
            textScaleFactor: 3,
          ),
        ],
      ),
    );
  }
}
