
import 'package:conte_kyoudokaihatsu/login_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "conte",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFDE24F),
          foregroundColor: Color(0xFF000000),
        )
      ),
      home: LoginPage(),
    );
  }
}
