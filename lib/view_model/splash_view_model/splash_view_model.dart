

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedinclone/view/auth_view/singin_view/signin_view.dart';
import 'package:linkedinclone/view/bottom_navigatore_view.dart';
import 'package:linkedinclone/view_model/get_logedin_user_data_view_model/get_logedin_user_data_view_model.dart';

class SplashViewModel {

  final _auth = FirebaseAuth.instance;
  final GetLogedinUserDataViewModel logedinUserDataViewModel = GetLogedinUserDataViewModel();

  void splashTime(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3), () {});
    if(_auth != null){
      logedinUserDataViewModel.getLogedinUserData();
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => _auth != null ? BottomNavigatoreView() : SignInView()));

  }

}