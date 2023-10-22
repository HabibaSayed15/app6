import 'package:flutter/material.dart';
import 'package:flutter1/color.dart';
import 'package:flutter1/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Appco.background,
          inputDecorationTheme: InputDecorationTheme(
            
              prefixIconColor: Appco.lamon,
              suffixIconColor: Appco.lamon,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Appco.lamon),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Appco.lamon),
                  borderRadius: BorderRadius.circular(15)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(15)),
              labelStyle: const TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: const SplashState(),
    );
  }
}
