import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class MyNetworkView extends StatelessWidget {
  MyNetworkView({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppCollors.backgroundColor,
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
      body: Column(
        children: [

          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // total invitaion
                MyText(title: "Invitions (10)",fontSize: 20,fontWeight: FontWeight.bold,),

                // requested connection
                Container(
                  color: AppCollors.whiteColor,
                  // margin: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(radius: 30,),
                          const SizedBox(width: 6,),

                          // name and invation
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(title: "M Hashim",fontSize: 18,fontWeight: FontWeight.bold,),
                              MyText(title: "Inviting you to Connect",color: Colors.grey,),
                            ],
                          ),
                        ],
                      ),

                      // accecpt or cancle icon buttons,
                      Row(
                        children: [
                          Icon(Icons.cancel_outlined,size: 40,color: AppCollors.grayColor),
                          Icon(Icons.check_circle_outline,size: 40,color: AppCollors.primaryColor,),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4,),
                Container(
                  color: AppCollors.whiteColor,
                  // margin: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(radius: 30,),
                          const SizedBox(width: 6,),

                          // name and invation
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(title: "M Hashim",fontSize: 18,fontWeight: FontWeight.bold,),
                                MyText(title: "Inviting you to Connect",color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // accecpt or cancle icon buttons,
                      Row(
                        children: [
                          Icon(Icons.cancel_outlined,size: 40,color: AppCollors.grayColor),
                          Icon(Icons.check_circle_outline,size: 40,color: AppCollors.primaryColor,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // people may you knoe grid view

          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 4,
                  childAspectRatio: 2/3
                ),
                itemCount: 6,
                itemBuilder: (context , index) {
              return Card(
                elevation: 8,
                child: Stack(
                  children: [
                    //user backgound image
                    Container(
                      height: height * 0.08,
                      color: AppCollors.grayColor,
                    ),

                    // user profile image
                    Positioned(
                      top: 20,
                        left: 46,
                        child: CircleAvatar(radius: 40,)
                    ),

                    // user name
                    Positioned(
                        top: 106,
                        left: 40,
                        child: MyText(title: "M Hashim",fontWeight: FontWeight.bold,fontSize: 20,)),

                    // user work description here
                    Positioned(
                        top: 130,
                        child: MyText(title: 'Flutter developer | cyber expert',textAlign: TextAlign.center,))
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
