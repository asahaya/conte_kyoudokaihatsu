import 'package:conte_kyoudokaihatsu/home_page.dart';
import 'package:conte_kyoudokaihatsu/post_model.dart';
import 'package:conte_kyoudokaihatsu/style.dart';
import 'package:conte_kyoudokaihatsu/timeline/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<DropdownMenuItem<int>> _item = [];
  int selectItem = 0;
  bool switchValue = true;
  String switchText = "ネタバレ";
  var sliderValue = 2.5;
  var sliderText = "評価";
  double changeValue = 0.0;

  // var labelText='yy/mm/dd';
  //
  // Future<void> selectData(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2015),
  //     lastDate: DateTime(2025),
  //   );
  //
  //
  //   if (selected!=null){
  //     setState(() {
  //       labelText=(DateFormat('yyyy/MM/dd E')).format(selected);
  //
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    setItems();
    selectItem = _item[0].value!; //強制アクセス
  }

  void setItems() {
    _item..add(DropdownMenuItem(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            "配信プラットフォームを選択",
          )),
      value: 1,
    ))..add(DropdownMenuItem(
      child: Text(
        "TVer",
      ),
      value: 10,
    ))..add(DropdownMenuItem(
      child: Text(
        "Youtube",
      ),
      value: 20,
    ))..add(DropdownMenuItem(
      child: Text(
        "radiko",
      ),
      value: 30,
    ))..add(DropdownMenuItem(
      child: Text(
        "Netflix",
      ),
      value: 40,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostModel>(
      create: (_) => PostModel(),
      child: Scaffold(
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
            Consumer<PostModel>(builder: (context, model, child) {
              return IconButton(
                  onPressed: () async {
                    try {
                      model.startLoading();
                      await model.addPost();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                      );
                    } catch (e) {
                      final snackbar = SnackBar(
                          backgroundColor: Colors.greenAccent,
                          content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      print(e);
                    } finally {
                      model.endLoading();
                    }
                  },
                  icon: Icon(Icons.done));
            }),
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
            child: Consumer<PostModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(model.conteDate.toString(),style: conteDateFont),
                            IconButton(icon: Icon(Icons.date_range),
                              onPressed: ()=>model.selectData(context),),
                          ],
                        ),

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
                          onChanged: (text) {
                            model.title = text;
                          },
                        ),
                        DropdownButtonFormField(
                          autofocus: false,
                          items: _item,
                          value: selectItem,
                          focusColor: Colors.red,
                          onChanged: (int? selectValue) async {
                            model.dropdownSetting(selectValue);
                            model.platform =
                            await model.dropdownSetting(selectValue);
                            //
                            // setState(() {
                            //   _selectItem = selectValue!;
                            // });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(),
                        TextFormField(
                            maxLength: null,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: "レビュー",
                                hintText: "コンテンツ名を入力"),
                            onChanged: (text) {
                              model.review = text;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3CD4BD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Slider(
                                  value: sliderValue,
                                  min: 0.0,
                                  max: 50,
                                  divisions: 50,
                                  activeColor: Colors.yellow,
                                  inactiveColor: Color(0xFFFFFFFF),
                                  onChanged: (double value) async {
                                    setState(() async {
                                      // model.dropdownSetting(selectValue);
                                      // model.platform=await model.dropdownSetting(selectValue);
                                      sliderValue = value.roundToDouble();

                                      sliderText = "$sliderValue";
                                      changeValue =
                                          double.parse(sliderText.toString());
                                      changeValue /= 10;
                                      model.starSetting(changeValue);
                                      // model.star=model.starSetting(changeValue);
                                      // onChanged: (int? selectValue) async{
                                      // model.dropdownSetting(selectValue);
                                      // model.platform=await model.dropdownSetting(selectValue);
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
                                          changeValue.toString(),
                                          style: TextStyle(fontSize: 20),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SwitchBar(),
                        SwitchListTile(
                            value: switchValue,
                            title: Text(switchText),
                            activeColor: Color(0xFF3CD4BD),
                            onChanged: (bool value) async {
                              setState(() {
                                switchValue = value;
                                if (switchValue == true) {
                                  switchText = "ネタバレあり";
                                } else {
                                  switchText = "ネタバレなし";
                                }
                                model.netabare = switchText;
                              });
                            }),
                        Text("Picture"),
                        GestureDetector(
                          child: Container(
                            color: Colors.greenAccent,
                            child: SizedBox(
                              height: 100,
                              child: model.imageFile != null
                                  ? Image.file(model.imageFile!)
                                  : Container(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          onTap: () async {
                            print("picker-------------------");
                            await model.pickImage();
                          },
                        )
                      ],
                    ),
                  ),
                  if(model.isLoading)
                    Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              );
              ////

            }),
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
//
// class SliderBar extends StatefulWidget {
//   @override
//   _SliderBarState createState() => _SliderBarState();
// }
//
// class _SliderBarState extends State<SliderBar> {
//
//   var _sliderValue = 2.5;
//   var _sliderText = "評価";
//   double _changeValue = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<PostModel>(
//       create: (_) => PostModel(),
//       child: Consumer<PostModel>(builder: (context, model, child) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: Slider(
//                   value: _sliderValue,
//                   min: 0.0,
//                   max: 50,
//                   divisions: 50,
//                   activeColor: Colors.yellow,
//                   inactiveColor: Color(0xFFFFFFFF),
//                   onChanged: (double value) async{
//                     setState(() async {
//                       // model.dropdownSetting(selectValue);
//                       // model.platform=await model.dropdownSetting(selectValue);
//                       _sliderValue = value.roundToDouble();
//
//                       _sliderText = "$_sliderValue";
//                       _changeValue = double.parse(_sliderText.toString());
//                       _changeValue /= 10;
//                      await model.starSetting(_changeValue);
//                       model.star=model.starSetting(value).toString();
//                       // model.star=_changeValue.toString();
//
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Row(
//                   children: [
//                     Center(
//                         child: Icon(
//                       Icons.star,
//                       color: Colors.yellow,
//                     )),
//                     SizedBox(width: 5),
//                     Center(
//                         child: Text(
//                       _changeValue.toString(),
//                       style: TextStyle(fontSize: 20),
//                     )),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }
//       ),
//     );
//   }
//
// }
//
// class SwitchBar extends StatefulWidget {
//   @override
//   _SwitchBarState createState() => _SwitchBarState();
// }
//
// class _SwitchBarState extends State<SwitchBar> {
//   bool _switchValue = true;
//   String _switchText = "ネタバレ";
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SwitchListTile(
//             value: _switchValue,
//             title: Text(_switchText),
//             activeColor: Color(0xFF3CD4BD),
//             onChanged: (bool value) {
//               setState(() {
//                 _switchValue = value;
//                 if (_switchValue == true) {
//                   _switchText = "ネタバレあり";
//                 } else {
//                   _switchText = "ネタバレなし";
//                 }
//                 model.netabare=_switchText;
//               });
//             }),
//         // Text(_switchText,style: TextStyle(color: Colors.blue),),
//       ],
//     );
//   }
// }
//
//
