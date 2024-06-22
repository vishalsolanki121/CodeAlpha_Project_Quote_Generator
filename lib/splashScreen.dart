import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:quote_generater/QuoteGenerator.dart';  // Import for using Timer

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>QuoteGenerator()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFF3EA5), Color(0xffAF47D2), Color(0xffB6FFFA)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
            "𝘘𝘶𝘰𝘵𝘦𝘴",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

