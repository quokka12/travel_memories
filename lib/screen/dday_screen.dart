import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jinjicouple/functions.dart';
import 'package:jinjicouple/module/my_text.dart';
import 'package:jinjicouple/widgets/post_app_bar.dart';
import 'package:lottie/lottie.dart';

class DDayScreen extends StatelessWidget {
  DDayScreen({Key? key}) : super(key: key);
  final now = DateTime.now();
  String date = "20180203";
  MyText myText = MyText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCC8D1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: PostAppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          myText.normal(24, '우리가 처음 만난 날', Colors.white),
          myText.normal(22, '2018.02.03', Colors.white),
          myText.bold(
              30,
              'D+${int.parse(now.difference(DateTime.parse(date)).inDays.toString())}',
              Colors.white),
          Lottie.asset(
            "assets/animations/dday.json",
            width: sizeOfWidth(context, 1),
            height: sizeOfHeight(context, 0.1),
          ),
          Image.asset(
            'assets/images/dday.png',
            width: sizeOfWidth(context, 1),
            height: sizeOfHeight(context, 0.4),
          ),
        ],
      ),
    );
  }
}
