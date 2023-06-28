import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

class Post {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection("posts");
  /* 미디어 파일 저장 공간 가져오기 */
  final storage = FirebaseStorage.instance;
  String? pid;
  String? postTitle;
  String? postContent;
  String? placeName;
  String? category;
  List? images;
  String? dateOfPost;
  List storageUrls = [];

  void getPostInfo(
      postTitle, postContent, placeName, category, images, dateOfPost) {
    this.postTitle = postTitle;
    this.postContent = postContent;
    this.placeName = placeName;
    this.category = category;
    this.images = images;
    this.dateOfPost = dateOfPost;
  }

  Future addPostToFirebase() async {
    DocumentReference docRef = collectionReference.doc();
    await docRef.set({
      "pid": docRef.id,
      "postTitle": postTitle,
      "postContent": postContent,
      "placeName": placeName,
      "category": category,
      "images": storageUrls,
      "dateOfPost": getToday(),
    });
  }

  Future uploadImageFile(List<File> files) async {
    try {
      final storageRef = storage.ref();
      for (final file in files) {
        final mountainsRef = storageRef
            .child('posts/')
            .child('/${Timestamp.now()}.jpg'); //사진 저장 경로
        UploadTask uploadTask = mountainsRef.putFile(file);
        storageUrls.add(await (await uploadTask).ref.getDownloadURL());
      }
    } catch (e) {
      print(e);
    }
  }

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('yyyy-MM-dd');
    String strToday = format.format(now);
    return strToday;
  }
}
