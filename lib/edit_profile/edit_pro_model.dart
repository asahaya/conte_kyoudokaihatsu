import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileModel extends ChangeNotifier {
  EditProfileModel(this.proName, this.proBio,) {
    proNameCon.text = proName.toString();
    proBioCon.text = proBio.toString();

  }

  final proNameCon = TextEditingController();
  final proBioCon = TextEditingController();

  String? proName;
  String? proBio;
  File? profileImage;
  final profilePicker = ImagePicker();

  void setProName(String proName) {
    this.proName = proName;
    notifyListeners();
  }

  void setProBio(String proBio) {
    this.proBio = proBio;
    notifyListeners();
  }


  bool isProfileUpdate() {
    return proName != null || proBio != null;
  }

  Future updateProfile() async {
    this.proName = proNameCon.text;
    this.proBio = proBioCon.text;

    final uid = FirebaseAuth.instance.currentUser!.uid;

    final proDoc = FirebaseFirestore.instance.collection("account").doc();

    String? proIconURL;
    if (profileImage != null) {
      //storage
      final profileStorage = await FirebaseStorage.instance
          .ref('account/${proDoc.id}')
          .putFile(profileImage!);
      proIconURL = await profileStorage.ref.getDownloadURL();
    }

    await FirebaseFirestore.instance.collection("account").doc(uid).update({
      "proName": proName,
      'proBio': proBio,
      'proIcon': proIconURL,
    });
  }

  Future profilePickerImage() async {
    final profilePickerFile =
        await profilePicker.pickImage(source: ImageSource.gallery);
    if (profilePickerFile != null) {
      profileImage = File(profilePickerFile.path);
      notifyListeners();
    }
  }
}
