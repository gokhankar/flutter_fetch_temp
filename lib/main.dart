import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/pages/home.dart';
import 'package:new_app/pages/home2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(title: 'Flutter Demo Home Page'),
      // home: Home2(),
    );
  }
}
