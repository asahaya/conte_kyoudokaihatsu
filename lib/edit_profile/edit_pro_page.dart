import 'dart:io';

import 'package:conte_kyoudokaihatsu/edit_profile/edit_pro_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage(this.proName, this.proBio,);

  final String? proName;
  final String? proBio;
  // final String? proIconURL;


  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider<EditProfileModel>(
      create: (_) => EditProfileModel(proName, proBio),
      child: Scaffold(
        appBar: AppBar(
          title: Text('プロフィール編集'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Consumer<EditProfileModel>(builder: (context, model, child) {
              // model.profileImage= File(proIconURL.toString());
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: model.proNameCon,
                      decoration: InputDecoration(
                        hintText: "名前",
                      ),
                      onChanged: (text) {
                        //ここで取得したTextを使う
                        // model.title = text;
                        model.setProName(text);
                      },
                    ),
                    TextField(
                      controller: model.proBioCon,
                      decoration: InputDecoration(
                        hintText: "bio",
                      ),
                      onChanged: (text) {
                        //ここで取得したTextを使う
                        // model.author = text;
                        model.setProBio(text);
                      },
                    ),
                    GestureDetector(
                      child: SizedBox(
                        height: 199,
                        child: model.profileImage == null
                              ? Container(child: Image.asset("assets/images/not_user"))
                            : Container(child: Image.file(model.profileImage!)),

                      ),
                      onTap: () async {
                        await model.profilePickerImage();
                        print("------------------>StorageProfile呼び出し");
                      },
                    ),
                    ElevatedButton(
                      onPressed: model.isProfileUpdate()
                          ? () async {
                              //画面遷移
                              try {
                                await model.updateProfile(); //追加の処理
                                Navigator.of(context).pop(true);
                              } catch (e) {
                                final snackbar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(e.toString()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              }
                            }
                          : null,
                      child: Text("更新する"),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
