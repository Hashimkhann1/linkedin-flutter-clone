import 'package:flutter/material.dart';
import 'package:linkedinclone/view/auth_view/signup_view/signup_view.dart';
import 'package:linkedinclone/view/bottom_navigatore_view.dart';
import 'package:linkedinclone/view/home_view/home_view.dart';
import 'package:linkedinclone/view/splash_view/spalsh_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView()
    );
  }
}
