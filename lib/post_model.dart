
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PostModel extends ChangeNotifier {
  String? id;
  // return Post(id,title,platform,review,star,netabare);
  String? title;
  String? platform;
  String? review;
  String? star;
  String? netabare;
  // String? image2;
  // String? image3;
  DateTime? uptime;
  // late List<String?> calImages;
  int? selectnumber = 0;
  String conteDate="配信日を選択-----＞";
  String? conteDateMD;
  String? conteDateEE;
  Timestamp? uploadPostTime;

  File? imageFile;
  final picker1=ImagePicker();

  bool isLoading=false;


  void startLoading(){
    isLoading=true;
    notifyListeners();
  }
  void endLoading(){
    isLoading=false;
    notifyListeners();
  }


  // PostModel({this.selectnumber});
  starSetting(double? changeValue) {
    if(changeValue!=null){
      star=changeValue.toString();
    }
    notifyListeners();
  }

  dropdownSetting(int? selectValue) {
    if (selectValue != null) {
      // await selectnumber = selectValue;
      // await platform!=selectnumber;
      switch (selectValue) {
        case 10:
          platform = "Tver";
          break;
        case 20:
          platform = "Youtube";
          break;
        case 30:
          platform = "radiko";
          break;
        case 40:
          platform = "Netflix";
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
    if (netabare == null) {
      throw "netanasi>>>>>>>>>";
    }
    if(star==null){
      throw ">starnashi___________>";
    }
   final doc=FirebaseFirestore.instance.collection('post').doc();

    String? imageURL1;
    if(imageFile!=null) {
      //Firestoreにアップする前にStorageにアップする
    final task=await FirebaseStorage.instance.ref('post/${doc.id}').putFile(imageFile!);
    imageURL1 =await task.ref.getDownloadURL();
    }
    uptime=await DateTime.now();

    await doc.set({
      'id': id,
      // return Post(id,title,platform,review,star,netabare);
      'title': title,
      'platform': platform,
      'review': review,
      'star': star,
      'netabare': netabare,
      'image1': imageURL1,
      // 'image2': image2,
      // 'image3': image3,
      'uptime': uptime,
      // 'calImages':calImages,
      'conteDate':conteDate,
      'conteDateMD':conteDateMD,
      'conteDateEE':conteDateEE,
      'uploadPostTime':Timestamp.now(),
    });


  }

  Future pickImage()async{
    final pickerFile=await picker1.pickImage(source: ImageSource.gallery);
    if(pickerFile!=null){
      imageFile=File(pickerFile.path);
      notifyListeners();
    }
  }

  var labelText='yy/mm/dd';
  var labelText2='yy/mm/dd';
  var labelText3='yy/mm/dd';

  Future<DateTime?> selectData(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );


    if (selected!=null){
        labelText=(DateFormat('yyyy/MM/dd E')).format(selected);
        labelText2=(DateFormat('MM/dd')).format(selected);
        labelText3=(DateFormat('E')).format(selected);
        conteDate=labelText;
        conteDateMD=labelText2;
        conteDateEE=labelText3;
    }
    notifyListeners();
  }


}
