import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/res/widgets/my_textformfield_widget.dart';
import 'package:linkedinclone/view_model/getx/loading_getx/loading_getx.dart';
import 'package:linkedinclone/view_model/profile_view_model/profile_view_model.dart';

class UpdateProfileIntro extends StatelessWidget {
  UpdateProfileIntro({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _headLine = TextEditingController();

  final ProfileViewModel profileViewModel = ProfileViewModel();
  final LoadingGetx loadingGetx = Get.put(LoadingGetx());


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppCollors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppCollors.backgroundColor,
        title: MyText(
          title: "Edit intro",
          color: AppCollors.blackColor,
        ),
        iconTheme: IconThemeData(color: AppCollors.blackColor),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                MyText(
                  title: "* Indicates required",
                  color: AppCollors.grayColor,
                ),
                const SizedBox(
                  height: 40,
                ),

                Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        // first name* text form field,
                        MyTextFormField(
                          hintText: 'First name',
                          labelText: "First name*",
                          controller: _firstName,
                          underlineBorder: true,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter first name";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // last name* text form field,
                        MyTextFormField(
                          hintText: 'Last name',
                          labelText: "Last name*",
                          controller: _lastName,
                          underlineBorder: true,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter last name";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // Headline* text form field,
                        MyTextFormField(
                          hintText: 'Headline',
                          labelText: "Headline*",
                          controller: _headLine,
                          underlineBorder: true,
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter headline";
                            }
                          },
                        ),
                      ],)),
                const SizedBox(
                  height: 20,
                ),

                // save button
                Obx(() => MyTextButton(
                  title: "Save",
                  loading: loadingGetx.isLoading.value,
                  loadingColor: AppCollors.whiteColor,
                  backgroundColor: AppCollors.primaryColor,
                  textColor: AppCollors.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  width: width,
                  height: height * 0.05,
                  borderRadius: BorderRadius.circular(16),
                  alignment: Alignment.center,
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      profileViewModel.updateIntro(context, _firstName.text.toString(), _lastName.text.toString(), _headLine.text.toString());
                      _firstName.clear();
                      _lastName.clear();
                      _headLine.clear();
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
