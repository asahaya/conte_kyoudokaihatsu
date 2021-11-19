import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {
  String? title;
  String? review;
  String? platform;
  String? netabare;
  int? selectnumber = 0;

  // PostModel({this.selectnumber});



   dropdownSetting(int? selectValue)  {
     if (selectValue != null) {
      // await selectnumber = selectValue;
      // await platform!=selectnumber;
      switch(selectValue){
        case 10:
          platform="Tver";
          break;
        case 20:
          platform="Youtube";
          break;
        case 30:
          platform="radiko";
          break;
        case 40:
          platform="Netflix";
          break;
      }
      return platform;
    } else {
      print("");
    }
    notifyListeners();
  }



  Future addPost() async {
    if (title == null) {
      throw "???";
    }
    if (review == null) {
      throw "???";
    }
    if (platform == null) {
      // switch (platform){
      //   case
      // }
    }
    if(netabare==null){
      throw ">>";
    }

    await FirebaseFirestore.instance.collection('post').add({
      'title': title,
      'review': review,
      'platform': platform,
      'netabare': netabare,
    });
  }
}
