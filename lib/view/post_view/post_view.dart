import 'package:flutter/material.dart';
import 'package:linkedinclone/res/app_colors/app_colors.dart';
import 'package:linkedinclone/res/constant.dart';
import 'package:linkedinclone/res/widgets/my_text_button_widget.dart';
import 'package:linkedinclone/res/widgets/my_text_widget.dart';
import 'package:linkedinclone/res/widgets/my_textformfield_widget.dart';
import 'package:linkedinclone/view/bottom_navigatore_view.dart';
import 'package:linkedinclone/view/home_view/home_view.dart';

class PostView extends StatelessWidget {
  PostView({super.key});

  // post controller
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppCollors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppCollors.backgroundColor,
        elevation: 0,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatoreView()));
          },
          child: Icon(
            Icons.cancel_outlined,
            color: Colors.black54,
            size: 36,
          ),
        ),
        title: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://cdn-icons-png.flaticon.com/128/4140/4140061.png')
                )
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            MyText(
              title: "Anyone",
              color: AppCollors.grayColor,
            )
          ],
        ),
        actions: [
          Icon(
            Icons.watch_later_outlined,
            color: Colors.black54,
            size: 32,
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: MyTextButton(
              title: 'Post',
              fontWeight: FontWeight.bold,
              fontSize: 17,
              backgroundColor: AppCollors.primaryColor,
              width: width * 0.17,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextFormField(
              hintText: "What do you wnat to talk about?",
              fontSize: 19,
              fontWeight: FontWeight.bold,
              hintTextColor: AppCollors.grayColor,
              minLines: 7,
              enabledBorderSide: BorderSide(color: AppCollors.backgroundColor),
              focusBorderSide: BorderSide(color: AppCollors.backgroundColor),
              controller: _postController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.image,size: 32,),
                SizedBox(width: 20,),
                Icon(Icons.add,size: 32,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
