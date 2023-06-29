import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jinjicouple/widgets/post_app_bar.dart';
import 'package:jinjicouple/widgets/post_bottom_bar.dart';

import '../post/post.dart';

class PostScreen extends StatelessWidget {
  Post post;
  PostScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(post.storageUrls[0]),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: PostAppBar(),
          ),
          bottomNavigationBar: PostBottomBar(post: post),
        ),
      ),
    );
  }
}
