import 'package:conte_kyoudokaihatsu/login_model.dart';
import 'package:conte_kyoudokaihatsu/register/email_register_page.dart';
import 'package:conte_kyoudokaihatsu/home_page.dart';
import 'package:conte_kyoudokaihatsu/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<LoginModel>(builder: (context, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    onChanged: (email) {
                      model.setEmail(email);
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
                    onChanged: (password) {
                      model.setPassword(password);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      child: Text("mail login"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPrimary: Colors.black,
                          primary: Colors.white),
                      onPressed: () async {
                        model.startLoading();
                        //画面遷移
                        try {
                          await model.login(); //追加の処理
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        } catch (e) {
                          final snackbar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        print(e);
                        } finally {
                          model.endLoading();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 220,
                    height: 40,
                    child: ElevatedButton(
                      child: Text("mail register"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPrimary: Colors.black,
                          primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EmailRegisterPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // SizedBox(
                  //   width: 220,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         SizedBox(
                  //             height: 25,
                  //             width: 40,
                  //             child: CircleAvatar(
                  //                 child:
                  //                     Image.asset("assets/images/google.jpg"))),
                  //         Text("でログイン"),
                  //       ],
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //         textStyle: TextStyle(fontSize: 20),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50),
                  //         ),
                  //         onPrimary: Colors.black,
                  //         primary: Colors.white),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 20,
                    child: ElevatedButton(
                      child: Text("エスケープ"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPrimary: Colors.black,
                          primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      },
                    ),
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
