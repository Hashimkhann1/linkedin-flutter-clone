import 'package:flutter/material.dart';
import 'package:linkedinclone/res/constant.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Constant.logo,width: 154,height: 154,),
      ),
    );
  }
}
