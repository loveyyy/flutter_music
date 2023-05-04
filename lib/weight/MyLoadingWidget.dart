import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyLoadingWidget extends StatelessWidget {
  @required bool isShow;
  String text;

  MyLoadingWidget({ Key? key, required this.isShow, required this.text})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
     return SizedBox.expand( //
          child: new Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(),
            ),
            child: new Center( //保证控件居中效果
              child: new SizedBox(
                width: 120.0,
                height: 120.0,
                child: new Container(
                  decoration: ShapeDecoration(
                    color: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new CircularProgressIndicator(),
                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: new Text(
                          text,
                          style: new TextStyle(fontSize: 12.0,color: Colors.black,decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )// 创建透明层
      );
  }}