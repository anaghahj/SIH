import 'package:pulley_app/screens/screen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.jpg",height:30),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_rounded,color: Colors.black,),
        ),
        elevation: 10,
      ),
      body: const Screen(),
    );
  }
}
