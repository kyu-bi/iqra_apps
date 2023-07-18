import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iqra_app/modules/menu_utama.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MenuUtama(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("assets/img/splash.png"), fit: BoxFit.fill),
        // ),
        child: Image.asset(
          "assets/img/splash.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
