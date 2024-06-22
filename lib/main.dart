import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quote_generater/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(background: Colors.redAccent),
      ),
      // home: QuoteGenerator(),
      home: SplashScreen(),
    );
  }
}
