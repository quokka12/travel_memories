import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jinjicouple/module/my_text.dart';
import 'package:jinjicouple/screen/add_post/add_post_form.dart';

import '../../widgets/post_app_bar.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({Key? key}) : super(key: key);
  MyText myText = MyText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: PostAppBar(),
      ),
      body: SingleChildScrollView(
        child: AddPostForm(),
      ),
    );
  }
}
