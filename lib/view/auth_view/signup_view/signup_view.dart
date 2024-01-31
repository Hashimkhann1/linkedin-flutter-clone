import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/res/widgets/my_textformfield_widget.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


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
                  title: "Sign Up",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                MyText(title: 'Touch with profissional world!'),
                const SizedBox(
                  height: 14,
                ),

                // email textfield
                MyTextFormField(hintText: "Email", controller: _emailController),
                const SizedBox(
                  height: 10,
                ),

                // password textfield
                MyTextFormField(
                    hintText: "Password", controller: _passwordController),
                const SizedBox(
                  height: 16,
                ),

                // confirm password
                MyTextFormField(
                    hintText: "Confirm Password", controller: _confirmPasswordController),
                const SizedBox(
                  height: 16,
                ),
                // sign in button
                MyTextButton(
                  title: 'Sign Up',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textColor: AppCollors.whiteColor,
                  backgroundColor: AppCollors.primaryColor,
                  width: width * 0.99,
                  height: height * 0.07,
                  borderRadius: BorderRadius.circular(28),
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 24,),

                // new to linkedin
                MyTextButton(title: "Already have an account? Sign in",fontSize: 18,fontWeight: FontWeight.bold,textColor: AppCollors.primaryColor,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
