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
  Color greetingColor = Colors.black; // Nuevo estado para el color del saludo

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      userName = sp.getString("userName") ?? "";
      // Recupera el color del saludo del almacenamiento persistente
      greetingColor =
          (sp.getBool("isDark") ?? false) ? Colors.white : Colors.black;
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
              onPressed: () async {
                uiProvider.changeTheme();
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setBool("isDark", uiProvider.isDark);
                setState(() {
                  greetingColor =
                      uiProvider.isDark ? Colors.white : Colors.black;
                });
              },
            );
          }),
        )
      ],
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Hola, ',
              style: TextStyle(
                color: greetingColor, // Usa el color del saludo
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: userName,
              style: TextStyle(
                color: greetingColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
