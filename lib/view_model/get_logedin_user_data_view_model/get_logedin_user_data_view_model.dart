


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/model/logedin_user_data_model/logedin_user_data_model.dart';
import 'package:linkedinclone/view_model/logedin_user_data_list_view_model/logedin_user_data_list_view_model.dart';

class GetLogedinUserDataViewModel {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('users');

  final LogedinUserDataListViewModel logedinUserDataListViewModel = Get.put(LogedinUserDataListViewModel());

  void getLogedinUserData() async {
    try{
      DocumentSnapshot<Map<String, dynamic>> data = await _firestore.doc(_auth.currentUser!.uid.toString()).get();
      print(data.data());

      if(data.data() != null){
        dynamic userData = await LogedinUserDataModel.fromJson(data.data()!);
        logedinUserDataListViewModel.logedinUserDataList.add(userData);
      }
    }catch(error){
      print('error while getting logedin user data from GetLogedinUserDataViewModel $error');
    }
  }

}