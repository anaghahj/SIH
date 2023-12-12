import 'dart:async';

import 'package:pulley_app/modals/constant.dart';
import 'package:pulley_app/modals/local_store.dart';
import 'package:pulley_app/modals/remote_store.dart';
import 'package:pulley_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

late ObjectBox objectbox;
late RemoteStore remoteStore;

ThemeData ttheme = ThemeData.light().copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.white,
    ),
    colorScheme: kLightColorScheme,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    
   );
ThemeData dtheme = ThemeData.dark().copyWith(
   useMaterial3: true,
    appBarTheme: const AppBarTheme().copyWith(
      
      color: Colors.black,
    ),
    colorScheme: kDarkColorScheme,
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    );
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();
  remoteStore = RemoteStore.create();
  Timer(const Duration(seconds: 15), () {runApp(const MyApp()); });
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bit.exe',
        theme: ttheme,
        darkTheme: dtheme,
        home: const SplashScreen());
  }
}
