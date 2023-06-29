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
  String? dateOfPost;
  List imageUrls = [];
  List storageUrls = [];

  void getPostInfo(postTitle, postContent, placeName, category) {
    this.postTitle = postTitle;
    this.postContent = postContent;
    this.placeName = placeName;
    this.category = category;
  }

  Future addPostToFirebase() async {
    DocumentReference docRef = collectionReference.doc();
    await docRef.set({
      "pid": docRef.id,
      "postTitle": postTitle,
      "postContent": postContent,
      "placeName": placeName,
      "category": category,
      "imageUrls": imageUrls,
      "storageUrls": storageUrls,
      "dateOfPost": getToday(),
    });
  }

  Future deletePost() async {
    try {
      await collectionReference.doc(pid).delete();
    } catch (e) {
      print(e);
    }
  }

  Future uploadImageFile(List<File?> files) async {
    try {
      final storageRef = storage.ref();
      for (final file in files) {
        String name = '/${Timestamp.now()}.jpg';
        final mountainsRef = storageRef.child('posts/').child(name); //사진 저장 경로
        imageUrls.add(name);
        UploadTask uploadTask = mountainsRef.putFile(file!);
        storageUrls.add(await (await uploadTask).ref.getDownloadURL());
      }
    } catch (e) {
      print(e);
    }
  }

  Future deleteImageFile() async {
    try {
      final storageRef = storage.ref();
      for (final file in imageUrls) {
        final mountainsRef = storageRef.child('posts/').child(file); //사진
        await mountainsRef.delete();
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
