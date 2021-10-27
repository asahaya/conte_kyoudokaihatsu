import 'package:flutter/material.dart';

class EmailRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          child: Column(
            children: [
              Text(
                "メールアドレスとパスワードを入力してください",
              ),
              TextFormField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    labelText: "email",
                    hintText: "メールアドレスを入力"),
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: "password",
                    hintText: "パスワードを入力"),
              ),
              SizedBox(height: 20,),
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
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
