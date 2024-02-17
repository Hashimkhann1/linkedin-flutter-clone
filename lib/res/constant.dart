import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/res/widgets/my_textformfield_widget.dart';
import 'package:linkedinclone/view_model/getx/loading_getx/loading_getx.dart';
import 'package:linkedinclone/view_model/profile_view_model/profile_view_model.dart';

class Constant {
  static String logo = 'assets/images/linkedin.png';
  static String fullnamelogo = 'assets/images/fullnamelogo.png';
  static String messages = 'assets/images/write_11477188';

  final _auth = FirebaseAuth.instance;
  final LoadingGetx loadingGetx = Get.put(LoadingGetx());

  final editAboutController = TextEditingController();

  // toast message

  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppCollors.primaryColor,
      textColor: AppCollors.whiteColor,
    );
  }


  // bottom sheet for profile about update
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppCollors.backgroundColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // cancle Icon
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.cancel_rounded,
                    color: AppCollors.grayColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // about title
                MyText(
                  title: "Edit about",
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 20,
                ),

                // textfield for edit about
                MyTextFormField(
                  hintText: "About",
                  controller: editAboutController,
                  minLines: 10,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                // save about button
                Obx(() {
                  return MyTextButton(
                    title: "Save",
                    loading: loadingGetx.isLoading.value,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: AppCollors.whiteColor,
                    width: width,
                    height: height * 0.06,
                    backgroundColor: AppCollors.primaryColor,
                    alignment: Alignment.center,
                    onTap: () async {
                      // loadingGetx.setLoading();
                      if(editAboutController.text.isNotEmpty){
                        // await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).update({
                        //   'profileAbout': editAboutController.text.toString(),
                        // }).then((value) {
                        //   loadingGetx.setLoading();
                        //   Constant().toastMessage("Profile about updated successfully");
                        // }).onError((error, stackTrace) {
                        //   loadingGetx.setLoading();
                        //   Constant().toastMessage("Try again something went wrong");
                        // });
                        ProfileViewModel().updateAboutProfile(context, editAboutController.text.toString());
                      }else{
                        Constant().toastMessage("About Not be empty");
                      }
                    },
                  );
                })
              ],
            ),
          );
        });
  }
}
