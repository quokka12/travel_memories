import 'dart:io';
import 'dart:typed_data';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jinjicouple/functions.dart';
import 'package:jinjicouple/module/my_text.dart';

import '../../post/post.dart';
import '../home/home_screen.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  final _formKey = GlobalKey<FormState>();
  MyText myText = MyText();
  List<File?> images = <File?>[];
  final controller_title = TextEditingController();
  final controller_content = TextEditingController();
  final controller_name = TextEditingController();
  final controller_category = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller_title.dispose();
    controller_content.dispose();
    controller_name.dispose();
    controller_category.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myText.normal(myText.TITLE3, '카테고리 선택', Colors.black87),
            SizedBox(height: 15),
            categoryHelper(),
            SizedBox(height: 30),
            placeNameHelper(),
            SizedBox(height: 30),
            titleHelper(),
            SizedBox(height: 30),
            contentHelper(),
            Container(
              width: sizeOfWidth(context, 1),
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () => getImage(),
                  child: myText.underline(16, '사진 추가하기', Colors.black87)),
            ),
            Container(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < images.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              title: myText.normal(
                                  myText.TITLE3, '사진 삭제', Colors.black87),
                              content: myText.normal(
                                  myText.BODY, '사진을 삭제하시겠습니까?', Colors.black87),
                              actions: [
                                TextButton(
                                  child: myText.normal(
                                      myText.TITLE3, '삭제', Colors.black87),
                                  onPressed: () {
                                    Get.back();
                                    setState(() {
                                      images.removeAt(i);
                                    });
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
                        child: imageWidget(images[i]),
                      ),
                      SizedBox(width: 5),
                    ],
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            btnAddHelper(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget categoryHelper() {
    return CustomDropdown(
      hintText: '카테고리 선택',
      items: const [
        '식당',
        '카페',
        '놀거리',
        '사진 명소',
        '숙소',
        '추억',
      ],
      controller: controller_category,
      borderSide: BorderSide(color: Color(0xff8F93EA)),
    );
  }

  Widget placeNameHelper() {
    return TextFormField(
      validator: (value) {
        if (value.toString().length < 1)
          return '장소이름을 입력하여 주세요.';
        else
          return null;
      },
      controller: controller_name,
      decoration: InputDecoration(
        labelText: '장소이름',
        hintStyle: TextStyle(color: Colors.grey[600]),
        suffixIcon: Icon(Icons.store),
      ),
    );
  }

  Widget titleHelper() {
    return TextFormField(
      validator: (value) {
        if (value.toString().length < 1)
          return '일기제목을 입력하여 주세요.';
        else
          return null;
      },
      controller: controller_title,
      decoration: InputDecoration(
        labelText: '일기제목',
        hintStyle: TextStyle(color: Colors.grey[600]),
        suffixIcon: Icon(Icons.account_balance_wallet_outlined),
      ),
    );
  }

  Widget contentHelper() {
    return TextFormField(
      validator: (value) {
        if (value.toString().length < 1)
          return '일기내용을 입력하여 주세요.';
        else
          return null;
      },
      maxLength: 100,
      minLines: 5,
      maxLines: 10,
      controller: controller_content,
      decoration: InputDecoration(
        labelText: '일기내용',
        hintStyle: TextStyle(color: Colors.grey[600]),
        suffixIcon: Icon(Icons.border_color_outlined),
      ),
    );
  }

  Widget imageWidget(url) {
    return Container(
      height: 150,
      width: 200,
      child: Image.file(File(url!.path), fit: BoxFit.fill),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? img = File(image!.path);
    img = await cropImage(img);
    setState(() {
      if (img != null) {
        images.add(img);
      }
    });
  }

  Future cropImage(File imageFile) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 3),
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Widget btnAddHelper() {
    return Container(
      alignment: Alignment.center,
      width: sizeOfWidth(context, 1),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
        onPressed: () => addPost(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              myText.normal(18, '일기 추가하기', Colors.white),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addPost() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    if (controller_category.text == "") {
      showToast("카테고리를 선택해주세요.");
      return;
    }
    Post post = Post();
    post.getPostInfo(
      controller_title.text.toString(),
      controller_content.text.toString(),
      controller_name.text.toString(),
      controller_category.text.toString(),
    );
    if (images.isNotEmpty) {
      await post.uploadImageFile(images);
    }
    await post.addPostToFirebase();
    Get.to(HomeScreen());
  }
}
