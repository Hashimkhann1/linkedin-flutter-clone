import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/view/profile_view/profile_view.dart';
import 'package:linkedinclone/view_model/auth/auth_view_model.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final AuthViewModel authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.10,bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // user profile image
                        CircleAvatar(
                          radius: 38,
                          child: Image.network('https://cdn-icons-png.flaticon.com/128/4140/4140061.png'),
                        ),
                        const SizedBox(height: 10,),

                        // user name
                        MyText(title: "Muhammad Hashim",color: AppCollors.blackColor,fontSize: 21,fontWeight: FontWeight.bold,),
                        const SizedBox(height: 8,),
                        MyText(title: "View profile",color: AppCollors.grayColor,fontSize: 15,fontWeight: FontWeight.bold,),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),

                // divider
                Divider(color: AppCollors.grayColor,),

                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16,),
                      // profile viewers
                      RichText(text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan> [
                            TextSpan(
                                text: "81 ",
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)
                            ),TextSpan(
                              text: "profile viewers",
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ]
                      )),
                      const SizedBox(height: 30,),

                      // post impressions
                      RichText(text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan> [
                            TextSpan(
                                text: "279 ",
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)
                            ),TextSpan(
                              text: "post impressions",
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ]
                      )),
                      const SizedBox(height: 16,),
                    ],
                  ),
                ),

                // divider
                Divider(color: AppCollors.grayColor,),

                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30,),
                      // Groups and Events
                      MyText(title: "Groups",fontSize: 22,fontWeight: FontWeight.bold,color: AppCollors.blackColor,),
                      const SizedBox(height: 30,),
                      MyText(title: "Events",fontSize: 22,fontWeight: FontWeight.bold,color: AppCollors.blackColor,),
                      const SizedBox(height: 70,),
                    ],
                  ),
                ),

                // divider
                Divider(color: AppCollors.grayColor,),

              ],
            ),


            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // setting
                  InkWell(
                    onTap: () {
                      authViewModel.signOut(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.settings,size: 28,),
                        const SizedBox(width: 6,),
                        MyText(title: 'Settings',fontSize: 20,fontWeight: FontWeight.bold,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
