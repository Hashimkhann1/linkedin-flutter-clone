

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/view_model/getx/loading_getx/loading_getx.dart';

class ProfileViewModel {

  final _auth = FirebaseAuth.instance.currentUser!;
  final _firestore = FirebaseFirestore.instance.collection('users');

  final Constant constant = Constant();
  final LoadingGetx loadingGetx = Get.put(LoadingGetx());

  // update profile intro
  updateIntro(BuildContext context , String firstName , lastName , headlines) async {
    loadingGetx.setLoading();
    try{
      await _firestore.doc(_auth.uid).update({
        "firstName": firstName,
        "lastName": lastName,
        "headlin": headlines,
      }).then((value) {
        constant.toastMessage("Profile updated successfully");
        loadingGetx.setLoading();
        Navigator.pop(context);
      });
    }catch(error){
      loadingGetx.setLoading();
      constant.toastMessage("Try again something went wrong");
      print('error while updating profile intro from ProfileViewModel $error');
    }
  }

}