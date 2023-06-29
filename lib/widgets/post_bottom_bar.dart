import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jinjicouple/functions.dart';
import 'package:jinjicouple/module/my_text.dart';
import 'package:jinjicouple/screen/home/home_screen.dart';

import '../post/post.dart';

class PostBottomBar extends StatelessWidget {
  Post post;
  PostBottomBar({Key? key, required this.post}) : super(key: key);
  MyText myText = MyText();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myText.bold(myText.TITLE3, post.postTitle.toString(),
                        Colors.black87),
                    TextButton(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: myText.normal(
                                  myText.TITLE3, '추억 삭제', Colors.black87),
                              content: myText.normal(
                                  myText.BODY, '추억을 삭제하시겠습니까?', Colors.black87),
                              actions: [
                                TextButton(
                                  child: myText.normal(
                                      myText.TITLE3, '삭제', Colors.black87),
                                  onPressed: () async {
                                    Get.back();
                                    await post.deleteImageFile();
                                    await post.deletePost();

                                    Get.to(HomeScreen());
                                  },
                                ),
                                TextButton(
                                  child: myText.normal(
                                      myText.TITLE3, '닫기', Colors.black87),
                                  onPressed: () => Get.back(),
                                ),
                              ],
                            ),
                          );
                        },
                        child: myText.underline(
                            myText.BODY, '추억 삭제', Color(0xff808080))),
                  ],
                ),
                SizedBox(height: 10),
                myText.normal(myText.BODY, '장소 : ${post.placeName.toString()}',
                    Colors.black87),
                SizedBox(height: 15),
                myText.normal(
                    myText.BODY, post.postContent.toString(), Colors.black87),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < post.storageUrls.length; i++) ...[
                        imageWidget(post.storageUrls[i]),
                        SizedBox(width: 5),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget imageWidget(url) {
    return Container(
      height: 150,
      width: 200,
      child: Image.network(url, fit: BoxFit.fill),
    );
  }
}
