import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// return Post(id,title,platform,review,star,netabare);
class Post {
  Post(
      //ここの順番を間違えると配置がおかしくなる
    this.id,
    this.user,
    this.title,
    this.platform,
    this.review,
    this.star,
    this.netabare,
      this.imageURL1,
      // this.image2,
      // this.image3,
      this.uptime,
      // this.calImages,
      this.conteDate,
  this.conteDateMD,
  this.conteDateEE,
      this.uploadPostTime,
  );

  String id;
  String user;
  String title;
  String platform;
  String review;
  String star;
  String netabare;
  String? imageURL1;
  // String? image2;
  // String? image3;
  DateTime? uptime;
  // List<String?> calImages;
  String? conteDate;
  String? conteDateMD;
  String? conteDateEE;
  Timestamp? uploadPostTime;


}
