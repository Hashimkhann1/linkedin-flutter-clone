import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCollors.whiteColor,
      key: scaffoldKey,
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
      drawer: Drawer(),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context , index) {
        return ListTile(
          horizontalTitleGap: 4,
          contentPadding: EdgeInsets.only(left: 4, top: 10,bottom: 14),
          leading: CircleAvatar(
            radius: 26,
            child: Image.network('https://cdn-icons-png.flaticon.com/128/4140/4140061.png',),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'M Hashim: ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Add a Post and this title will be here and its description will also be here',
                  ),
                ],
              ),
            ),
          ),

          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(title: '20m'),
                Icon(Icons.more_vert_rounded)
              ],
            ),
          ),
        );
      })
    );
  }
}
