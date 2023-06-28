import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      items: [
        Icon(Icons.location_on_outlined, size: 30, color: Color(0xffEDAE49)),
        Icon(Icons.home, size: 30, color: Color(0xffD1495B)),
        Icon(Icons.map_outlined, color: Color(0xff00798C)),
      ],
    );
  }
}
