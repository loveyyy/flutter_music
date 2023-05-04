import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/model/music_entity.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPage();
  }
}

class _SearchPage extends State with AutomaticKeepAliveClientMixin {
  List<MusicDataList> _list = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void inputChange(text) async {
    if (text != null) {
      var list = await ApiRepository.searchMusic(1, text);
      setState(() {
        _list = list.data!.list!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("搜索"),
        ),
        body: Column(
          children: [
            new Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    width: 1, style: BorderStyle.solid, color: Colors.grey),
                color: Colors.white,
              ),
              child: Row(children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: new Image(image: new AssetImage("images/search.png")),
                ),
                Expanded(
                  child: new TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "请输入歌曲名称或者歌手名称"),
                    onChanged: (value) {
                      return inputChange(value);
                    },
                  ),
                ),
              ]),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _list.length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //点击
                          print("点击选中" + index.toString());
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              _list[index].mname! + "---" + _list[index].sname!,
                              style: TextStyle(fontSize: 16),
                            )),
                      );
                    }))
          ],
        ));
  }
}
