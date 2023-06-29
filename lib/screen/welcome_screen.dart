import 'package:flutter/material.dart';
import 'package:jinjicouple/functions.dart';
import 'package:jinjicouple/module/my_text.dart';

import 'home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  MyText myText = MyText();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"),
              fit: BoxFit.cover,
              opacity: 0.9,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      myText.bold(35, '진지커플 기록공간', Colors.white),
                      SizedBox(height: 12),
                      myText.bold(24, '지수와 진형이의 추억을 담는 공간', Colors.white),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xffFFAE88).withOpacity(0.8),
                        Color(0xff8F93EA).withOpacity(0.8)
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          myText.normal(18, '시작하기', Colors.white),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                myText.bold(18, "© Copyright 2023, 서진형", Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
