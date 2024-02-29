import 'package:flutter/material.dart';
import 'package:practice/core/themes/dark_mode.dart';
import 'package:practice/pages/auth/login/login_page.dart';
import 'package:practice/pages/home/home_page.dart';
import 'package:provider/provider.dart';
// import 'package:practice/pages/auth/login/login_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool('onboarding') ?? false;
  runApp(MyApp(onboarding: onboarding));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          //* Dark Mode and Light Mode
          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
            useMaterial3: true,
          ),
          // home: const LoginPage(),
          home: onboarding ? const HomePage() : const LoginPage(),
        );
      }),
    );
  }
}
