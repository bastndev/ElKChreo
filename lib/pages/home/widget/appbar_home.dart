import 'package:flutter/material.dart';
import 'package:practice/core/themes/dark_mode.dart';
import 'package:provider/provider.dart';
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
          // Dark Mode and Light Mode change button
          child: Consumer<UiProvider>(builder: (context, uiProvider, child) {
            return IconButton(
              icon: uiProvider.isDark
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny),
              onPressed: () {
                uiProvider.changeTheme();
              },
            );
          }),
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
