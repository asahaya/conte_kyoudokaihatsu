import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TimeLinePage extends StatelessWidget {
  final calImages = [
    "assets/images/suiyoubithree.jpg",
    "assets/images/suiyoubitwo.jpg",
    "assets/images/suiyoubi.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Image.asset("assets/images/appbar_icon.png"),
        title: SizedBox(
            height: 50, child: Image.asset("assets/images/appbar_icon.png")),
        actions: [
          Icon(Icons.logout),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.notifications_active),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 210,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(20),
                            // image: DecorationImage(
                            //   image: AssetImage("assets/images/suiyoubi.jpg"),
                            // ),
                          ),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              enableInfiniteScroll: true,
                              // autoPlayAnimationDuration: Duration(milliseconds: 800),
                              // onPageChanged: callbackFunction,
                            ),
                            items: calImages.map((calImage) {
                              return Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                  // image: DecorationImage(
                                  //   image: AssetImage("assets/images/suiyoubi.jpg"),
                                  // ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(calImage),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //star
                          StarReview(context),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Container(
                        height: 210,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 10),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                  //Sa
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              // width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                        "10/31",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                      flex: 1,
                                      child: Center(child: Text("Wed"))),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                  child: Wrap(
                                    children: [Center(
                                        child: Text(
                                          "水曜日のダウンタウン[ラヴィット!&KOCの裏側密着]",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),],

                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  Colors.red.withOpacity(0.9),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "Youtube",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  Colors.grey.withOpacity(0.9),
                                            ),
                                            child: Center(
                                                child: Text(
                                                    "https://www.youtube.com/watch?v=wkZZpStoDqU&t=3939s")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(flex: 1, child: Container()),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 3,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Colors.red, width: 3)),
                                    child: Text(
                                      "ネタバレあり",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text("▼ "),
                                ],
                              ),
                              Text(
                                "とても面白かっ-----------------------------------------------------------------------------たとても面白かった-とても面白かったとても面白かっ-たとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かったとても面白かった",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFF27AA96),
                  ),
                  AccountParts(),
                  Divider(
                    color: Color(0xFF27AA96),
                  ),
                  ActionIconParts(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget StarReview(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.center,
        width: 70,
        height: 20,
        child: Text("★3.9"),
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.blue, width: 2),
        ),
      ),
    ],
  );
}

class AccountParts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/suiyoubi.jpg"),
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "アサノ111111111111",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "2021/10/31 12:00",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: Icon(Icons.app_registration)),
        ],
      ),
    );
  }
}

class ActionIconParts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Icon(Icons.camera_enhance_outlined),
              SizedBox(
                width: 10,
              ),
              Text("222"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Icon(Icons.remove_red_eye),
              SizedBox(
                width: 10,
              ),
              Text("222"),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Icon(Icons.local_fire_department_rounded),
              SizedBox(
                width: 10,
              ),
              Center(child: Text("2223")),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Icon(Icons.comment),
              SizedBox(
                width: 10,
              ),
              Text("2244"),
            ],
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }
}
