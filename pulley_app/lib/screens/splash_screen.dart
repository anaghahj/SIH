import 'dart:async';
import 'package:pulley_app/main.dart';
import 'package:pulley_app/modals/constant.dart';
import 'package:pulley_app/screens/login_screen.dart';
import 'package:pulley_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    userbox.isEmpty() ? null : last_user = userbox.getAll()[0];
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          if (last_user == null) {
            return const Login();
          }
          remoteStore.setUsersCollection(
              last_user!.username + last_user!.userId.toString());
          return const Mainscreen();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/Pulley.png',
              width: 300,
            ),
            const Text('Damage Pulley Detector'),
          ],
        ),
      ),
    );
  }
}
