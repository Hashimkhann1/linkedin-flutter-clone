import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class MyAppBarView extends StatelessWidget {
  const MyAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppCollors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: AppCollors.whiteColor,
        leading: InkWell(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/128/4140/4140061.png',
            ),
          ),
        ),
        title: Container(
          height: 30,
          decoration: BoxDecoration(
            color: AppCollors.lightGrayColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              const SizedBox(width: 6),
              Icon(
                Icons.search,
                color: AppCollors.grayColor,
              ),
              const SizedBox(width: 4),
              MyText(title: "Search", fontSize: 14, color: AppCollors.grayColor),
            ],
          ),
        ),
        actions: [
          Icon(Icons.message, color: AppCollors.grayColor),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
