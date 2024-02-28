import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarHome extends StatefulWidget implements PreferredSizeWidget {
  const AppBarHome({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  _AppBarHomeState createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
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
      leading: IconButton(
        icon: const SizedBox(),
        onPressed: () {},
      ),
      titleSpacing: -40.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.abc),
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
