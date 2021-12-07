import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// return Post(id,title,platform,review,star,netabare);
class Profile {
  Profile(
      //ここの順番を間違えると配置がおかしくなる
      this.id,
      this.proName,
      this.proMailAd,
      this.proBio,
      this.proIconURL,
      );

  String id;
  String proName;
  String proMailAd;
  String proBio;
  String proIconURL;


}
