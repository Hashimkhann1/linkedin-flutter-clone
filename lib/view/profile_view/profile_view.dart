import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/view/profile_view/update_profile_intro/update_profile_intro.dart';
import 'package:linkedinclone/view_model/logedin_user_data_list_view_model/logedin_user_data_list_view_model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Constant constant = Constant();

  final LogedinUserDataListViewModel logedinUserDataListViewModel =
      Get.put(LogedinUserDataListViewModel());


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final userData = logedinUserDataListViewModel.logedinUserDataList[0];

    return Scaffold(
        backgroundColor: AppCollors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppCollors.whiteColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppCollors.grayColor,
            ),
          ),
          title: Container(
            height: 30,
            decoration: BoxDecoration(
                color: AppCollors.lightGrayColor,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                const SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.search,
                  color: AppCollors.grayColor,
                ),
                const SizedBox(width: 4),
                MyText(
                  title: "Search",
                  fontSize: 14,
                  color: AppCollors.grayColor,
                )
              ],
            ),
          ),
          actions: [
            Icon(
              Icons.settings,
              color: AppCollors.grayColor,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: ListView(
          primary: true,
          children: [
            Column(
              children: [
                // profile Section
                Container(
                  color: AppCollors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // background and profile image
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // background image
                          Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.20,
                            color: Colors.greenAccent,
                            child: MyText(title: 'backround Image'),
                          ),

                          // background image changing icon
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppCollors.grayColor,
                                            spreadRadius: 5,
                                            blurRadius: 6,
                                            offset: Offset(0.1, 0.1))
                                      ]),
                                  child: Icon(
                                    Icons.edit,
                                    color: AppCollors.primaryColor,
                                  ))),

                          // profile image
                          Positioned(
                            bottom: -height * 0.12,
                            left: 10,
                            child: Container(
                              width: width * 0.35,
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                    'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=1480&t=st=1707041174~exp=1707041774~hmac=5bb7ecac2d13f31941cfa86c7a14d938cb23358af2425eb6a373742f3560f23c',
                                  ))),
                            ),
                          ),

                          // selet image icon
                          Positioned(
                              bottom: -height * 0.02,
                              left: width * 0.29,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppCollors.primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppCollors.whiteColor,
                                          width: 5.0)),
                                  child: Icon(
                                    Icons.add,
                                    color: AppCollors.whiteColor,
                                    size: 26,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),

                      // name my work info and total connections
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // user name and edit icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() {
                                  return MyText(
                                    title:
                                        "${logedinUserDataListViewModel.logedinUserDataList[0].firstName} ${logedinUserDataListViewModel.logedinUserDataList[0].lastName}",
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  );
                                }),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              fullscreenDialog: true,
                                              builder: (context) =>
                                                  UpdateProfileIntro(
                                                    firstName:
                                                        logedinUserDataListViewModel
                                                            .logedinUserDataList[
                                                                0]
                                                            .firstName,
                                                    lastName:
                                                        logedinUserDataListViewModel
                                                            .logedinUserDataList[
                                                                0]
                                                            .lastName,
                                                    headLine:
                                                        logedinUserDataListViewModel
                                                            .logedinUserDataList[
                                                                0]
                                                            .headlin,
                                                  )));
                                      // constant.showBottomSheet(context);
                                    },
                                    child: Icon(Icons.edit)),
                              ],
                            ),

                            // user information
                            Obx(() {
                              return MyText(
                                title:
                                    "${logedinUserDataListViewModel.logedinUserDataList[0].headlin}",
                                fontSize: 18,
                              );
                            }),
                            const SizedBox(
                              height: 12,
                            ),
                            // total connections
                            MyText(
                              title: "500+ connections",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppCollors.primaryColor,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                // About Section
                Container(
                  width: width,
                  color: AppCollors.whiteColor,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // about title and edit icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: "About",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          InkWell(
                            onTap: () {
                              Constant().showBottomSheet(context,logedinUserDataListViewModel.logedinUserDataList[0].profileAbout.toString());
                            },
                            child: Icon(
                              Icons.edit,
                              size: 28,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // about me
                      Obx(() {
                        return MyText(
                          title: logedinUserDataListViewModel.logedinUserDataList[0].profileAbout.toString(),
                          fontSize: 16,
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                // Activity Section
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: width,
                  color: AppCollors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // activity heading and two buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: "Activity",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),

                          // create post and another button
                          Row(
                            children: [
                              // create post button
                              MyTextButton(
                                width: width * 0.29,
                                height: height * 0.04,
                                alignment: Alignment.center,
                                title: 'Create a post',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                textColor: AppCollors.primaryColor,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color: AppCollors.primaryColor, width: 2.0),
                              ),
                              const SizedBox(
                                width: 8,
                              ),

                              // what content do you want to show first? button
                              Icon(
                                Icons.edit,
                                size: 28,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Muhammad Hashim ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: AppCollors.blackColor),
                                        ),
                                        TextSpan(
                                          text: 'posted this 1d',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: AppCollors.grayColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),

                                  // post image and descripition
                                  Row(
                                    children: [
                                      Container(
                                        width: width * 0.20,
                                        height: height * 0.10,
                                        decoration: BoxDecoration(
                                            color: AppCollors.grayColor,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses'
                                                    '_23-2149436188.jpg?w=1480&t=st=1707041174~exp=1707041774~hmac=5b'
                                                    'b7ecac2d13f31941cfa86c7a14d938cb23358af2425eb6a373742f3560f23c'))),
                                      ),
                                      Container(
                                        width: width * 0.74,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: MyText(
                                            title:
                                                "In publishing and graphic design, Lorem ipsum"
                                                " is a placeholder text commonly used to "
                                                "demonstrate the visual"),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: AppCollors.grayColor,
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
