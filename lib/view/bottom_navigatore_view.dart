import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/view/home_view/home_view.dart';
import 'package:linkedinclone/view/my_network_view/my_network_view.dart';
import 'package:linkedinclone/view/notification_view/notification_view.dart';
import 'package:linkedinclone/view/post_view/post_view.dart';

import 'profile_view/profile_view.dart';

class BottomNavigatoreView extends StatefulWidget {
  const BottomNavigatoreView({super.key});

  @override
  State<BottomNavigatoreView> createState() => _BottomNavigatoreViewState();
}

class _BottomNavigatoreViewState extends State<BottomNavigatoreView> {

  int selectedScreen = 0;

  List screens = [
      HomeView(),
      MyNetworkView(),
      PostView(),
      NotificationView(),
      ProfileView(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedScreen,
            selectedItemColor: AppCollors.blackColor,
            onTap: (index) {
              setState(() {
                selectedScreen = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 28,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group,size: 28,),
                label: 'My Network',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box,size: 28,),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(selectedScreen == 3 ? Icons.notifications_active : Icons.notifications,size: 28,),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_repair_service_rounded,size: 28,),
                label: 'Jobs',
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width / 5 * selectedScreen,
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: kBottomNavigationBarHeight,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppCollors.blackColor, width: 3.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
