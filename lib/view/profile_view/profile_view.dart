import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
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
      body: Column(),
    );
  }
}
