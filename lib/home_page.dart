//androidSDK16-->21
import 'package:conte_kyoudokaihatsu/timeline_page.dart';
import 'package:conte_kyoudokaihatsu/notification_page.dart';
import 'package:conte_kyoudokaihatsu/post_page.dart';
import 'package:conte_kyoudokaihatsu/profile_page.dart';
import 'package:conte_kyoudokaihatsu/search_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {

  List<Widget> _pages=[];
  //初期表示画面
  int _currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages=[
      TimeLinePage(),
      SearchPage(),
      PostPage(),
      NotificationPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,//横広がり固定
          showSelectedLabels: true, //選択時にLabel表示
          showUnselectedLabels: true,//選択以外のLabel表示
          selectedItemColor: Color(0xFFFDE24F),
          backgroundColor: Color(0xFFBAB4B4),
          unselectedItemColor: Color(0xFFFFFFFF),
          currentIndex:_currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: "timeline",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_post_office),
              label: "post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active),
              label: "notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "profile",
            ),
          ],
        ),
      );

  }
}
