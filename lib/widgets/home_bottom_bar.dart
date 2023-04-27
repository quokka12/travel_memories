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
        Icon(Icons.location_on_outlined, size: 30),
        Icon(Icons.home, size: 30, color: Colors.pink),
        Icon(Icons.map_outlined, size: 30),
      ],
    );
  }
}
