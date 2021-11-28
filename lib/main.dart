import 'package:conte_kyoudokaihatsu/home_page.dart';
import 'package:conte_kyoudokaihatsu/login_model.dart';
import 'package:conte_kyoudokaihatsu/login_page.dart';
import 'package:conte_kyoudokaihatsu/register/register_model.dart';
import 'package:conte_kyoudokaihatsu/timeline/timeline_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  timeAgo.setLocaleMessages("ja", timeAgo.JaMessages());
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Consumer<LoginModel>(builder: (context, model, child) {
          return MaterialApp(
            title: "conte",
            theme: ThemeData(
                appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFFFDE24F),
              foregroundColor: Color(0xFF000000),
            )),
            //LoginしているときはHomePageに直接飛ぶようにしたい
            home: FutureBuilder(
              future: model.judgeSignIn(),
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return HomePage();
                } else {
                  return LoginPage();
                }
              },
            ),
          );
        }
      ),
    );
  }
}
