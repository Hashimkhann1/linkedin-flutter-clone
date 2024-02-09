


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel {

  final _auth = FirebaseAuth.instance;

  // signIn method
  void signIn(BuildContext context , String gmail , password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: gmail, password: password).then((value) {

      }).onError((error, stackTrace){

      });

    }catch(error){
      print("error while siging in from AuthViewModel $error");
    }
  }

  // signUp method
  void signUp(BuildContext context , String gmail , password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: gmail, password: password).then((value){

      }).onError((error, stackTrace) {

      });
    }catch(error){
      print("error while siging Up from AuthViewModel $error");
    }
  }

  // signOut method
  void signOut() async {
    try{
      await _auth.signOut();
    }catch(error){
      print("error while siging out from AuthViewModel $error");
    }
  }

}