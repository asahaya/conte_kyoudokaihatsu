import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<DropdownMenuItem<int>> _item = [];
  int _selectItem = 0;

  @override
  void initState() {
    super.initState();
    setItems();
    _selectItem = _item[0].value!; //強制アクセス
  }

  void setItems() {
    _item
      ..add(DropdownMenuItem(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
            child: Text(
          "配信プラットフォームを選択",
        )),
        value: 1,
      ))
      ..add(DropdownMenuItem(
        child: Text(
          "TVer",
        ),
        value: 10,
      ))
      ..add(DropdownMenuItem(
        child: Text(
          "Youtube",
        ),
        value: 20,
      ))
      ..add(DropdownMenuItem(
        child: Text(
          "radiko",
        ),
        value: 30,
      ))
      ..add(DropdownMenuItem(
        child: Text(
          "Netflix",
        ),
        value: 40,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Icon(
            Icons.done,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: Text(
          "記事を投稿する",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      icon: Icon(Icons.tv),
                      labelText: "Title",
                      hintText: "コンテンツ名を入力"),
                ),
                DropdownButtonFormField(
                  autofocus: false,
                  items: _item,
                  value: _selectItem,
                  focusColor: Colors.red,
                  onChanged: (int? selectValue) {
                    setState(() {
                      _selectItem = selectValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(),
                TextFormField(
                  maxLines: 5,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "レビュー",
                      hintText: "コンテンツ名を入力"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF3CD4BD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SliderBar()),
                SwitchBar(),
                Text("Picture"),
                Row(
                  children: [
                    BoxPicture(context),
                    BoxPicture(context),
                    BoxPicture(context),
                    BoxPicture(context),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget BoxPicture(BuildContext context) {
  return Container(
    child: Center(child: Text("写真を投稿")),
    width: 124,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.grey,
      border: Border.all(color: Colors.black, width: 3),
      // border: Border.all(color: Colors.blue, width: 2),
    ),
  );
}

class SliderBar extends StatefulWidget {
  @override
  _SliderBarState createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  var _sliderValue = 2.5;
  var _sliderText = "評価";
  double _changeValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Slider(
            value: _sliderValue,
            min: 0.0,
            max: 50,
            divisions: 50,
            activeColor: Colors.yellow,
            inactiveColor: Color(0xFFFFFFFF),
            onChanged: (double value) {
              setState(() {
                _sliderValue = value.roundToDouble();

                _sliderText = "$_sliderValue";
                _changeValue = double.parse(_sliderText.toString());
                _changeValue /= 10;
              });
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Center(
                  child: Icon(
                Icons.star,
                color: Colors.yellow,
              )),
              SizedBox(width: 5),
              Center(
                  child: Text(
                _changeValue.toString(),
                style: TextStyle(fontSize: 20),
              )),
            ],
          ),
        ),
      ],
    );
  }
}

class SwitchBar extends StatefulWidget {
  @override
  _SwitchBarState createState() => _SwitchBarState();
}

class _SwitchBarState extends State<SwitchBar> {
  bool _switchValue = true;
  String _switchText = "ネタバレ";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
            value: _switchValue,
            title: Text(_switchText),
            activeColor: Color(0xFF3CD4BD),
            onChanged: (bool value) {
              setState(() {
                _switchValue = value;
                if (_switchValue == true) {
                  _switchText = "ネタバレあり";
                } else {
                  _switchText = "ネタバレなし";
                }
              });
            }),
        // Text(_switchText,style: TextStyle(color: Colors.blue),),
      ],
    );
  }
}
