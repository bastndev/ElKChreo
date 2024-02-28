// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppBarPe extends StatefulWidget {
//   const AppBarPe({super.key})

//   @override
//   State<AppBarPe> createState() => _AppBarPeState();
// } 

// class _AppBarPeState extends State<AppBarPe> {

//   String userName = "";
//   getData() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     setState(() {
//       userName = sp.getString("userName") ?? "";
//     });
//   }

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(userName), 
//       ),
//     );
//   }
// }