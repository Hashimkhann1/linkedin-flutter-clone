import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/res/widgets/my_textformfield_widget.dart';
import 'package:linkedinclone/view_model/auth/auth_view_model.dart';
import 'package:linkedinclone/view_model/getx/loading_getx/loading_getx.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  // form key
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthViewModel authViewModel = AuthViewModel();
  // initilazing LoadinGetx
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
                const MyText(
                  title: "Sign Up",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                const MyText(title: 'Touch with profissional world!'),
                const SizedBox(
                  height: 14,
                ),
                Form(
                  key: _formKey,
                    child:
                Column(
                  children: [
                    // email textfield
                    MyTextFormField(
                      hintText: "Email",
                      controller: _emailController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter Gmail";
                        }else if(!value.contains('@gmail.com')){
                          return "Invalid gmail";
                        };
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // password textfield
                    MyTextFormField(
                      hintText: "Password",
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter passsword";
                        }else if(value.length <= 7){
                          return "Password must be grather than 7 charcaters";
                        };
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    // confirm password
                    MyTextFormField(
                      hintText: "Confirm Password",
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter confirm password";
                        }else if(value != _passwordController.text){
                          return "Confiem password not matched";
                        };
                      },
                    ),
                  ],
                )),

                const SizedBox(
                  height: 16,
                ),
                // sign in button
                Obx(() => MyTextButton(
                  title: 'Sign Up',
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
                      authViewModel.signUp(context, _emailController.text.toString(), _passwordController.text.toString());
                    }
                  },
                ),),
                const SizedBox(
                  height: 24,
                ),

                // new to linkedin
                MyTextButton(
                  title: "Already have an account? Sign in",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textColor: AppCollors.primaryColor,
                  onTap: () {
                    Navigator.pop(context);
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
