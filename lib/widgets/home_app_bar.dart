import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jinjicouple/module/my_text.dart';
import 'package:jinjicouple/screen/add_post/add_post_screen.dart';
import 'package:jinjicouple/screen/dday_screen.dart';

import '../functions.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);
  MyText myText = MyText();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.to(DDayScreen()),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                        ),
                      ]),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.pinkAccent,
                    size: 26,
                  ),
                  SizedBox(width: 10),
                  myText.normal(20, "진지커플 여행일기", Colors.black),
                ],
              ),
              InkWell(
                onTap: () => Get.to(AddPostScreen()),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
