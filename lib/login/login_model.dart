

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {

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


  Future login() async {
    this.email = emailCon.text;
    this.password = passCon.text;

    if (email != null && password != null) {
      //ログイン
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!, password: password!);


      // final currentUser=FirebaseAuth.instance.currentUser;
      // final uid=currentUser!.uid;

    }
  }
  final FirebaseAuth _auth =FirebaseAuth.instance;

  Future<bool> judgeSignIn()async{
    final firebaseUser=_auth.currentUser;
    //ある
    if(firebaseUser!=null){
      return true;
    }//ない
    return false;
  }

}