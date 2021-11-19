import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conte_kyoudokaihatsu/domain/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimeLineModel extends ChangeNotifier {

  final _userCollection = FirebaseFirestore.instance.collection('post');
  List<Post>? post;

  void fetchPost() async {
    // final QuerySnapshot snapshot =
    //     await FirebaseFirestore.instance.collection("post").get();
    final QuerySnapshot snapshot=await _userCollection.get();

    final List<Post> post = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      // final String id = document.id;
      final String title = data['title'];
      final String platform = data['platform'].toString();
      final String review = data['review'];
      // final double star = data['star'];
      // final String? image = data['image'];
      final String? netabare = data['netabare'];
      return Post(title,review,platform,netabare);
    }).toList();

    this.post=post;
    notifyListeners();
  }
  Future logout()async{
    await FirebaseAuth.instance.signOut();
  }

}
