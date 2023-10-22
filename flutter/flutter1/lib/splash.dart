import 'package:flutter/material.dart';
import 'package:flutter1/color.dart';
import 'package:flutter1/login.dart';

class SplashState extends StatefulWidget {
  const SplashState({super.key});

  @override
  State<SplashState> createState() => __SplashStateState();
}

class __SplashStateState extends State<SplashState> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4),(){
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const Login())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/splash.png"),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 3,
            width: 300,
            color: const Color.fromARGB(255, 14, 14, 14),
          ),
          const SizedBox(
            height: 45,
          ),
          const Text(
            "Insight News",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Stay Informed, Anytime, Anywhere.",
            style: TextStyle(
                color: Appco.text, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      )),
    ));
  }
}
