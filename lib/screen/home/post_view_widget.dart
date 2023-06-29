import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jinjicouple/functions.dart';
import 'package:jinjicouple/post/post.dart';

import '../../module/my_text.dart';
import '../post_screen.dart';

class PostViewWidget extends StatefulWidget {
  const PostViewWidget({Key? key}) : super(key: key);

  @override
  State<PostViewWidget> createState() => _PostViewWidgetState();
}

class _PostViewWidgetState extends State<PostViewWidget> {
  MyText myText = MyText();
  String selectedCategory = "";

  var category = [
    '식당',
    '카페',
    '놀거리',
    '사진 명소',
    '숙소',
    '추억',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoryHelper(),
        SizedBox(height: 10),
        postViewHelper(),
      ],
    );
  }

  Widget categoryHelper() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            for (int i = 0; i < category.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category[i];
                  });
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedCategory == category[i]
                          ? const Color(0xffFFAE88)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    child: myText.normal(
                        15,
                        category[i],
                        selectedCategory == category[i]
                            ? Colors.white
                            : Colors.black87)),
              ),
          ],
        ),
      ),
    );
  }

  Widget postViewHelper() {
    CollectionReference postsRef =
        FirebaseFirestore.instance.collection("posts");
    if (selectedCategory == "") {
      return StreamBuilder(
          stream: postsRef.orderBy("dateOfPost").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              if (streamSnapshot.data?.docs.length != 0) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: streamSnapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Post post = Post();
                              post.getPostInfo(
                                  documentSnapshot['postTitle'],
                                  documentSnapshot['postContent'],
                                  documentSnapshot['placeName'],
                                  documentSnapshot['category']);
                              post.storageUrls =
                                  documentSnapshot['storageUrls'];
                              post.imageUrls = documentSnapshot['imageUrls'];
                              post.pid = documentSnapshot['pid'];
                              post.dateOfPost = documentSnapshot['dateOfPost'];
                              Get.to(PostScreen(post: post));
                            },
                            child: Container(
                              child: Image.network(
                                  documentSnapshot['storageUrls'][0],
                                  fit: BoxFit.fill),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myText.bold(20, documentSnapshot['placeName'],
                                    Colors.black87),
                                myText.normal(
                                    myText.BODY,
                                    documentSnapshot['dateOfPost'],
                                    Color(0xff808080)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  width: sizeOfWidth(context, 1),
                  alignment: Alignment.center,
                  child: myText.normal(16, '데이터가 없습니다...', Colors.black87),
                );
              }
            } else {
              return Container(
                width: sizeOfWidth(context, 1),
                alignment: Alignment.center,
                child: myText.normal(16, '데이터가 없습니다...', Colors.black87),
              );
            }
          });
    } else {
      print(selectedCategory);
      return StreamBuilder(
          stream: postsRef
              .where("category", isEqualTo: selectedCategory)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              if (streamSnapshot.data?.docs.length != 0) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: streamSnapshot.data?.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Post post = Post();
                              post.getPostInfo(
                                  documentSnapshot['postTitle'],
                                  documentSnapshot['postContent'],
                                  documentSnapshot['placeName'],
                                  documentSnapshot['category']);
                              post.storageUrls =
                                  documentSnapshot['storageUrls'];
                              post.imageUrls = documentSnapshot['imageUrls'];
                              post.pid = documentSnapshot['pid'];
                              post.dateOfPost = documentSnapshot['dateOfPost'];
                              Get.to(PostScreen(post: post));
                            },
                            child: Container(
                              child: Image.network(
                                  documentSnapshot['storageUrls'][0],
                                  fit: BoxFit.fill),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myText.bold(20, documentSnapshot['placeName'],
                                    Colors.black87),
                                myText.normal(
                                    myText.BODY,
                                    documentSnapshot['dateOfPost'],
                                    Color(0xff808080)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  width: sizeOfWidth(context, 1),
                  alignment: Alignment.center,
                  child: myText.normal(16, '데이터가 없습니다...', Colors.black87),
                );
              }
            } else {
              return Container(
                width: sizeOfWidth(context, 1),
                alignment: Alignment.center,
                child: myText.normal(16, '데이터가 없습니다...', Colors.black87),
              );
            }
          });
    }
  }
}
