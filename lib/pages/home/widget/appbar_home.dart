import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarHomePage extends StatefulWidget implements PreferredSizeWidget {
  const AppBarHomePage({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  AppBarHomePageState createState() => AppBarHomePageState();
}

class AppBarHomePageState extends State<AppBarHomePage> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.getString("userName") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.sunny),
            onPressed: () {},
          ),
        )
      ],
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
              text: 'Hola, ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: userName,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
