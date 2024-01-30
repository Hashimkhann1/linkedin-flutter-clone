import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // search controller
  final TextEditingController _searchController = TextEditingController();
  // scaffolsState
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppCollors.backgroundColor,
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 8,
              itemBuilder: (context , index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(vertical: 3),
                  height: height * 0.59,
                  decoration: BoxDecoration(
                      color: AppCollors.whiteColor
                  ),
                  child: Column(
                    children: [
                      // about person pic,name and shor description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              child: Image.network('https://cdn-icons-png.flaticon.com/128/4140/4140061.png',),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(title: 'M Hashim',fontSize: 16,fontWeight: FontWeight.bold,),
                                MyText(title: 'About my and My work',color: Colors.grey.shade600,)
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 4,),

                      // post description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: MyText(
                            title:
                            "the post description will be here the post description will be here the post description will be here"),
                      ),
                      const SizedBox(height: 6,),

                      // post image
                      Container(
                        height: height * 0.38,
                        decoration: BoxDecoration(
                            color: Colors.green.shade300
                        ),
                      ),

                      // like ,comment and repost buttons,
                      Divider(color: AppCollors.grayColor,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined,size: 22,),
                              MyText(title: 'Like')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.comment_outlined,size: 22,),
                              MyText(title: 'Comment')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.repeat,size: 22,),
                              MyText(title: 'Repost')
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.send,size: 22,),
                              MyText(title: 'Send')
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          ],)
    );
  }
}
