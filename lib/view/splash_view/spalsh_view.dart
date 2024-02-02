import 'package:flutter/material.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/view_model/splash_view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final SplashViewModel splashViewModel = SplashViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashViewModel.splashTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Constant.logo,width: 154,height: 154,),
      ),
    );
  }
}
