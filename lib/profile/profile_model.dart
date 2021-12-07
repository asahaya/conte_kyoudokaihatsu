import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileModel extends ChangeNotifier{

  bool isLoading=false;
  String? proName;
  String? proBio;
  String? email;
  String? proIconURL;

  void startLoading(){
    isLoading=true;
    notifyListeners();
  }
  void endLoading(){
    isLoading=false;
    notifyListeners();
  }
 void fetchUser() async{
   final user = FirebaseAuth.instance.currentUser;
   this.email=user?.email;

   final uid=FirebaseAuth.instance.currentUser!.uid;
   final snapshot=await FirebaseFirestore.instance.collection("account").doc(uid).get();
   final data=snapshot.data();
   this.proName=data?['proName'];
   this.proBio=data?['proBio'];
   this.proIconURL=data?['proIcon'];

   notifyListeners();
 }
 Future logOut()async{
    await FirebaseAuth.instance.signOut();
 }
}