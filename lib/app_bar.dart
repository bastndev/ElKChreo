import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar appBarHome(BuildContext context) {
  // final forUserProvider = Provider.of<ProfileDataProvider>(context);
  const icon = CupertinoIcons.moon_fill;

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
          icon: const Icon(icon),
          onPressed: () {},
        ),
      )
    ],
    title: RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        children: [
          TextSpan(
              text: 'Hola, ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              )),
          TextSpan(
            text: 'Lucas',
            style: TextStyle(
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
