import 'package:flutter/material.dart';
import 'package:flutter_app/weight/SearchPage.dart';

class TopWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 40,
      margin: EdgeInsets.only(top: 40,left: 25,right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: new Image(image: new AssetImage("images/search.png")),
          ),
          Expanded(
            child: GestureDetector(
              child: Text(
                  "请输入歌曲名称或者歌手名称"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SearchPage(),
                ));
              }),
          ),
        ],
      ),
    );
  }
}
