import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class MyNetworkView extends StatelessWidget {
  MyNetworkView({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppCollors.whiteColor,
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/128/4140/4140061.png',
              ),
            )),
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
            Icons.message,
            color: AppCollors.grayColor,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      backgroundColor: AppCollors.backgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // total invitaion
                    const MyText(
                      title: "Invitions (10)",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                    // requested connection
                    Container(
                      color: AppCollors.whiteColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      // margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 6,
                              ),

                              // name and invation
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  MyText(
                                    title: "M Hashim",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  MyText(
                                    title: "Inviting you to Connect",
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // accecpt or cancle icon buttons,
                          Row(
                            children: [
                              Icon(Icons.cancel_outlined,
                                size: 50, color: AppCollors.grayColor,),
                              Icon(
                                Icons.check_circle_outline,
                                size: 50,
                                color: AppCollors.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppCollors.grayColor,),
                    Container(
                      color: AppCollors.whiteColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      // margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                              ),
                              const SizedBox(
                                width: 6,
                              ),

                              // name and invation
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    MyText(
                                      title: "M Hashim",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    MyText(
                                      title: "Inviting you to Connect",
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // accecpt or cancle icon buttons,
                          Row(
                            children: [
                              Icon(Icons.cancel_outlined,
                                  size: 50, color: AppCollors.grayColor),
                              Icon(
                                Icons.check_circle_outline,
                                size: 50,
                                color: AppCollors.primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              // people may you knoe grid view

              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 2/2.5,
                children: [
                  Card(
                    elevation: 8,
                    child: Stack(
                      children: [
                        //user backgound image
                        Container(
                          height: height * 0.08,
                          decoration: BoxDecoration(
                            color: AppCollors.grayColor,
                            borderRadius: BorderRadius.circular(6)
                          ),
                        ),

                        // user profile image
                        const Positioned(
                            top: 20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: CircleAvatar(
                                radius: 40,
                              ),
                            )),

                        // user name
                        const Positioned(
                            top: 106,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: MyText(
                                title: "M Hashim",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),

                        // user work description here
                        Positioned.fill(
                            top: 140,
                            child: SizedBox(
                                width: width * 0.38,
                                child: const MyText(
                                  title: 'Flutter developer | cyber expert',
                                  textAlign: TextAlign.center,
                                ))),
                        const SizedBox(
                          height: 4,
                        ),
                        Positioned(
                            top: 180,
                            left: 0,
                            right: 0,
                            child: Center(
                                child: MyTextButton(
                                  title: 'Connect',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  textColor: AppCollors.primaryColor,
                                  border:
                                  Border.all(color: AppCollors.primaryColor,width: 2.0),
                                  width: width * 0.28,
                                  height: height * 0.04,
                                  alignment: Alignment.center,
                                  borderRadius: BorderRadius.circular(20),
                                )))
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    child: Stack(
                      children: [
                        //user backgound image
                        Container(
                          height: height * 0.08,
                          decoration: BoxDecoration(
                            color: AppCollors.grayColor,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          
                        ),

                        // user profile image
                        const Positioned(
                            top: 20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: CircleAvatar(
                                radius: 40,
                              ),
                            )),

                        // user name
                        const Positioned(
                            top: 106,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: MyText(
                                title: "M Hashim",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),

                        // user work description here
                        Positioned.fill(
                            top: 140,
                            child: SizedBox(
                                width: width * 0.38,
                                child: const MyText(
                                  title: 'Flutter developer | cyber expert',
                                  textAlign: TextAlign.center,
                                ))),
                        const SizedBox(
                          height: 4,
                        ),
                        Positioned(
                            top: 180,
                            left: 0,
                            right: 0,
                            child: Center(
                                child: MyTextButton(
                                  title: 'Connect',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  textColor: AppCollors.primaryColor,
                                  border:
                                  Border.all(color: AppCollors.primaryColor,width: 2.0),
                                  width: width * 0.28,
                                  height: height * 0.04,
                                  alignment: Alignment.center,
                                  borderRadius: BorderRadius.circular(20),
                                )))
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      )
    );
  }
}


