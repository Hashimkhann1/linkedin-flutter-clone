

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/view/auth_view/singin_view/signin_view.dart';
import 'package:linkedinclone/view/bottom_navigatore_view.dart';
import 'package:linkedinclone/view_model/getx/loading_getx/loading_getx.dart';

class AuthViewModel {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('users');
  // initilaing LoadinGetX
  final LoadingGetx loadingGetx = Get.put(LoadingGetx());

  // save initial user data
  initialUserData(String gmail) async {
    try{
    await _firestore.doc(_auth.currentUser!.uid).set({
      "userGmail": gmail.toString(),
      "userUid": _auth.currentUser!.uid,
      "DateTime": DateTime.now(),
    });
  }catch(e){
      print("Error while adding initial user data from  AuthViewModel $e");
    }
  }


  // signIn method
  void signIn(BuildContext context , String gmail , password) async {
    loadingGetx.setLoading();
    try{
      await _auth.signInWithEmailAndPassword(email: gmail, password: password).then((value) {
        loadingGetx.setLoading();
        toastMessage("Login successfull");
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatoreView()));
      });

    }on FirebaseAuthException catch(error){
      loadingGetx.setLoading();
      toastMessage(error.code.toString());
      print("error while siging in from AuthViewModel $error");
    }
  }

  // signUp method
  void signUp(BuildContext context , String gmail , password) async {
    loadingGetx.setLoading();
    try{
      await _auth.createUserWithEmailAndPassword(email: gmail, password: password).then((value){
        loadingGetx.setLoading();
        toastMessage("Sign Up successfull");
        initialUserData(gmail);
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatoreView()));
      });
    }on FirebaseAuthException catch(error){
      loadingGetx.setLoading();
      toastMessage(error.code.toString());
      print("error while siging Up from AuthViewModel $error");
    }
  }

  // signOut method
  void signOut(BuildContext context) async {
    try{
      await _auth.signOut().then((value) {
        toastMessage("User SignOut Successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInView()));
      });
    }catch(error){
      print("error while siging out from AuthViewModel $error");
    }
  }


  toastMessage(String message) {
    return Fluttertoast.showToast(
      msg: message.toString(),
      backgroundColor: AppCollors.primaryColor,
      textColor: AppCollors.whiteColor,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_LONG,
    );
  }

}