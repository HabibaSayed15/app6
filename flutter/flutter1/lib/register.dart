import 'package:flutter/material.dart';
import 'package:flutter1/color.dart';
import 'package:flutter1/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => __SplashStateState();
}

class __SplashStateState extends State<Register> {
  bool visabil = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/splash.png"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "creat an account",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text("Name"),
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name must not be empty!';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text("email"),
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email must not be empty!';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.length < 8) {
                  return 'password must not be less than 8 character!';
                }
                return null;
              },
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.visiblePassword,
              obscureText: visabil,
              decoration: InputDecoration(
                  label: const Text("password"),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visabil = !visabil;
                        });
                      },
                      icon: Icon((visabil)
                          ? (Icons.remove_red_eye)
                          : (Icons.visibility_off_rounded)))),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => )))
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appco.lamon,
                  fixedSize: const Size(150, 50),
                ),
                child: const Text(
                  "register",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("if you have account",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => const Login())));
                      },
                      child: Text("Login !",
                          style: TextStyle(fontSize: 20, color: Appco.lamon))),
                ],
              ),
            )
          ]),
        ),
      ),
    ))));
  }
}
