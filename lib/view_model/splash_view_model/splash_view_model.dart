

import 'package:flutter/material.dart';
import 'package:linkedinclone/view/auth_view/singin_view/signin_view.dart';
import 'package:linkedinclone/view/bottom_navigatore_view.dart';

class SplashViewModel {

  void splashTime(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3), () {});

    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInView()));

  }

}