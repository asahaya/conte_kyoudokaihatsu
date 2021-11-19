import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  final emailCon = TextEditingController();
  final passCon = TextEditingController();

  String? email;
  String? password;

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future signUp() async {
    this.email = emailCon.text;
    this.password = passCon.text;

    if (email != null && password != null) {
      //Authでユーザー作成
      final accountCre = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      final account = accountCre.user;
      if (account != null) {
        final uid = account.uid;


        //FireStoreに追加する
        final doc =
            FirebaseFirestore.instance.collection("account").doc(uid);

        await doc.set({
          'uid': uid,
          'email': email,
        });
      }
    }
  }
}
