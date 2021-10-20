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
        child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network('https://picsum.photos/250?image=9'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a ',
                  softWrap: true,
                  ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton(
                child: const Icon(
                Icons.error_outline_outlined,
              ),
                onPressed: () { /* ... */ },
              ),
              TextButton(
                child: const Icon(
                Icons.visibility_outlined,
              ),
                onPressed: () { /* ... */ },
              ),
              TextButton(
                child: const Icon(
                Icons.favorite_outlined,
              ),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Icon(
                Icons.insert_comment_outlined,
              ),
                onPressed: () { /* ... */ },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    ),
      ),
    );
  }
}
