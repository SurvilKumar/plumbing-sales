import 'package:flutter/material.dart';
import 'package:sales/presentation/utils/constants.dart';
import 'package:sales/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantsData.titel,
      theme: ThemeData(
          // primarySwatch: Colors.orange,
          ),
      home: const SplashScreen(),
    );
  }
}
