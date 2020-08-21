import 'package:flutter/material.dart';


class TopWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: (){
                print("user点击");
              },
              child:  new Image(image: new AssetImage("images/user.png")),
            ),
            padding: EdgeInsets.only(right: 5.0),
          ),
          Container(
            width: 285,
            child: GestureDetector(
              onTap: (){
                print("输入框点击");
              },
              child: new Text("点击搜索",
                style: new TextStyle(color: Colors.grey),
              ) ,
            ),
            padding: EdgeInsets.only(left: 5.0,right: 5.0),
          ),
          Container(
            child: GestureDetector(
              onTap: (){
                print("搜索点击");
              },
              child: new Image(image: new AssetImage("images/user.png")),
            ),
            padding: EdgeInsets.only(left: 5.0),
          )

        ],
      ),
    );
  }
}
