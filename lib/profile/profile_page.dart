import 'package:conte_kyoudokaihatsu/profile/profile_model.dart';
import 'package:conte_kyoudokaihatsu/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..fetchUser(),
      child: Consumer<ProfileModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("プロフィール"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("user", style: conteDateFont),
                Text(model.email ?? "not data", style: conteDateFont),
                Text("mailAd", style: conteDateFont),
                Text("bio", style: conteDateFont),
              ],
            ),
          ),
        );
      }),
    );
  }
}
