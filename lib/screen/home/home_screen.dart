import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jinjicouple/functions.dart';
import 'package:jinjicouple/module/my_text.dart';
import 'package:jinjicouple/screen/home/post_view_widget.dart';
import 'package:jinjicouple/screen/post_screen.dart';
import 'package:jinjicouple/widgets/home_app_bar.dart';
import 'package:jinjicouple/widgets/home_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyText myText = MyText();
  var category = [
    '식당',
    '카페',
    '놀거리',
    '사진 명소',
    '숙소',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: PostViewWidget(),
          ),
        ),
      ),
    );
  }
}
