import 'package:conte_kyoudokaihatsu/edit_profile/edit_pro_page.dart';
import 'package:conte_kyoudokaihatsu/login/login_model.dart';
import 'package:conte_kyoudokaihatsu/login/login_page.dart';
import 'package:conte_kyoudokaihatsu/profile/profile_model.dart';
import 'package:conte_kyoudokaihatsu/style.dart';
import 'package:conte_kyoudokaihatsu/timeline/timeline_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider<TimeLineModel>(create: (_)=>TimeLineModel()..fetchPost()),
      ChangeNotifierProvider<ProfileModel>(create: (_)=>ProfileModel()..fetchUser()),
      ChangeNotifierProvider<LoginModel>(create: (_)=>LoginModel()),
    ],
    // return ChangeNotifierProvider<ProfileModel>(create: (_) => ProfileModel()..fetchUser(),
      child: Consumer<ProfileModel>(builder: (context, model, child) {
        final String? profile = model.email;
        if (profile == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("プロフィール"),
          ),
          body: SafeArea(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                image: model.proIconURL!=null
                    ? NetworkImage(model.proIconURL!)
                    : NetworkImage("https://iconbox.fun/wp/wp-content/uploads/102_h_24.svg"),
                  fit: BoxFit.fitHeight
              ),),
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.6),
                          // height: double.infinity,
                          child: Column(
                            children: [
                              Text(model.proName ??"nameIN", style: conteDateFont),
                              Text(model.email ?? "not data", style: conteDateFont),
                              Text("mailAd", style: conteDateFont),
                              Text(model.proBio ??"nameIN", style: conteDateFont),
                              SizedBox(height: 200,
                                  child: model.proIconURL!=null
                                  ? Image.network(model.proIconURL!)
                                  : Image.asset("assets/images/not_user.png"),
                                  // Image.file(model.proIconURL ?? "assets/images/not_user.png")
                              ),
                              TextButton(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfilePage(model.proName,model.proBio)),
                                  );
                                  model.fetchUser();
                                },
                                child: Text("update"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await model.logOut();
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                },
                                child: Text("logout"),
                              ),
                            ],
                          ),
                        ),
                        if(model.isLoading)
                          Container(
                            color: Colors.blue,
                            child: Center(child: CircularProgressIndicator()),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
