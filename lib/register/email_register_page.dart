
import 'package:conte_kyoudokaihatsu/home_page.dart';
import 'package:conte_kyoudokaihatsu/register/register_model.dart';
import 'package:conte_kyoudokaihatsu/timeline/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (_) => RegisterModel(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "メールアドレスで登録",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<RegisterModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        "メールアドレスとパスワードを入力してください",
                      ),
                      TextFormField(
                        controller: model.emailCon,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            labelText: "email",
                            hintText: "メールアドレスを入力"),
                        onChanged: (text) {
                          model.setEmail(text);
                        },
                      ),
                      TextFormField(
                        controller: model.passCon,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            labelText: "password",
                            hintText: "パスワードを入力"),
                        onChanged: (text) {
                          model.setPassword(text);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 220,
                        height: 40,
                        child: ElevatedButton(
                          child: Text("登録"),
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              onPrimary: Colors.black,
                              primary: Colors.white),
                          onPressed: () async {
                            try {
                              await model.signUp();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(builder: (context)=>TimeLinePage()),
                              // );
                            } catch (e) {
                              print("eeeeeeeeeeeeeeeeeeee");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
