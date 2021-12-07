import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conte_kyoudokaihatsu/domain/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimeLineModel extends ChangeNotifier {


  final _userCollection = FirebaseFirestore.instance.collection('post');
  final _accountCollection = FirebaseAuth.instance;

  List<Post>? post;

  void fetchPost() async {
    // final QuerySnapshot snapshot =
    //     await FirebaseFirestore.instance.collection("post").get();
    final QuerySnapshot snapshot=await _userCollection.orderBy("uploadPostTime",descending:true).get();
    // final QuerySnapshot usersnapshot=await _accountCollection.currentUser.uid;

    // final uid=FirebaseAuth.instance.currentUser!.uid;
    // final usersnapshot=await FirebaseFirestore.instance.collection("account").doc(uid).get();
    // final userdata=usersnapshot.data();




    final uid=FirebaseAuth.instance.currentUser!.uid;
    final usersnapshot=await FirebaseFirestore.instance.collection("account").doc(uid).get();
    final userdata=usersnapshot.data();



    final FirebaseAuth firebaseAuthCollection =FirebaseAuth.instance;

    final List<Post> post = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    DateTime uptime=DateTime.now();

      final String id = document.id;
      final String user = userdata!['user'];
      final String title = data['title'];
      final String platform = data['platform'].toString();
      final String review = data['review'];
      final String star = data['star'];
      final String netabare = data['netabare'];
      final String? imageURL1 = data['image1'];
      // final String? image2 = data['image2'];
      // final String? image3 = data['image3'];
      // final DateTime? uptime=data['uptime'];
      data['uptime']=uptime;
      // final calImages=[image1,image2,image3];
      final String? conteDate=data['conteDate'];
      final String? conteDateMD=data['conteDateMD'];
      final String? conteDateEE=data['conteDateEE'];
      final Timestamp uploadPostTime=data['uploadPostTime'];
      return Post(id,user,title,platform,review,star,netabare,imageURL1,uptime,conteDate,conteDateMD,conteDateEE,uploadPostTime);
    }).toList();

    this.post=post;
    notifyListeners();
  }

  netabareColor(String? netabare){
    final bool? netabarebool;
    if(netabare=="ネタバレあり"){
      netabarebool=true;
      return netabarebool;
    }else {
      netabarebool=false;
      return netabarebool;
    }
  }



  Future logout()async{
    await FirebaseAuth.instance.signOut();
  }

  Future deleteTimeLine(Post post) async{
    await FirebaseFirestore.instance.collection('post').doc(post.id).delete();
  }

}
