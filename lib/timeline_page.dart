import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.directions),
        title: Text("conte!!"),
        actions: [
          Icon(Icons.logout),
          SizedBox(width: 20,),
          Icon(Icons.notifications_active),
          SizedBox(width: 20,),
        ],
      ),
      body: Center(
        child: Text("FEED"),
      ),
    );
  }
}
