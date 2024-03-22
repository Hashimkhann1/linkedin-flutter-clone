import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/res/widgets/my_textformfield_widget.dart';
import 'package:linkedinclone/view/auth_view/signup_view/signup_view.dart';
import 'package:linkedinclone/view/bottom_navigatore_view.dart';
import 'package:linkedinclone/view_model/auth/auth_view_model.dart';
import 'package:linkedinclone/view_model/getx/loading_getx/loading_getx.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthViewModel authViewModel = AuthViewModel();
  final LoadingGetx loadingGetx = Get.put(LoadingGetx());

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.14,
                ),
                Image.asset(
                  Constant.fullnamelogo,
                  width: 130,
                  height: 110,
                ),
                MyText(
                  title: "Sign in",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                MyText(title: 'Stay updated on your professional world'),
                const SizedBox(
                  height: 14,
                ),
                Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        // email textfield
                        MyTextFormField(
                          hintText: "Email",
                          controller: _emailController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Gmail";
                            }
                            else if(!value.contains("@gmail.com")){
                              return "Invalid Gmail";
                            }

                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // password textfield
                        MyTextFormField(
                          hintText: "Password",
                          controller: _passwordController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Password";
                            }

                          },
                        ),
                      ],
                    )
                ),
                const SizedBox(
                  height: 14,
                ),

                // forget password?
                MyTextButton(
                  title: "Forgot Password?",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textColor: AppCollors.primaryColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                // sign in button
                Obx(() {
                  return MyTextButton(
                    title: 'Sign in',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: AppCollors.whiteColor,
                    backgroundColor: AppCollors.primaryColor,
                    width: width * 0.99,
                    height: height * 0.07,
                    borderRadius: BorderRadius.circular(28),
                    alignment: Alignment.center,
                    loading: loadingGetx.isLoading.value,
                    loadingColor: AppCollors.whiteColor,
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        authViewModel.signIn(context, _emailController.text.toString(), _passwordController.text.toString());
                      }
                    },
                  );
                }),
                const SizedBox(
                  height: 24,
                ),

                // new to linkedin
                MyTextButton(
                  title: "New to linkedin? Join Now",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textColor: AppCollors.primaryColor,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
