import 'package:flutter/material.dart';
import 'package:iqra_app/constant/font_color.dart';
import 'package:iqra_app/modules/hijaiyah/views/huruf.dart';
import 'package:iqra_app/modules/splashscreen.dart';

void main() {
  runApp(IqraApp());
}

class IqraApp extends StatelessWidget {
  const IqraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: font,
      home: HurufHijaiyah(),
    );
  }
}
