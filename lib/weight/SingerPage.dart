import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/ApiRepository.dart';
import 'package:flutter_app/model/singer_entity.dart';
import 'package:flutter_app/weight/MyLoadingWidget.dart';
import 'package:flutter_app/weight/SingerInfoPage.dart';

class SingerPage extends StatefulWidget {
  SingerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SingerPage();
  }
}

class _SingerPage extends State with AutomaticKeepAliveClientMixin {
  SingerEntity? _singerEntity;
  var pageNum = 1;
  var pageTotal = 0;
  var map = new Map();
  bool alreadyDispose = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    map.putIfAbsent("referer", () => "https://zz123.com");
    map.putIfAbsent("authority", () => "mp3.haoge500.com");
    map.putIfAbsent("method", () => "GET");
    map.putIfAbsent("scheme", () => "https");
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    alreadyDispose = true;
  }



  void _loadData() async {
    if (pageTotal == 0) {
      var list = await ApiRepository.singerList(pageNum);
      if(!alreadyDispose){
        setState(() {
          _singerEntity = list;
          pageTotal = list.data!.totalPage!;
        });
      }
    }else{
      this._changeData();
    }

  }

  // 刷新
  Future<void> _onRefresh() async {
    this._loadData();
  }

  _changeData() async {
    //如果需要展示进度条，就必须try/catch捕获请求异常。
    pageNum = Random().nextInt(this.pageTotal);
    var list = await ApiRepository.singerList(pageNum);
    if(!alreadyDispose){
      setState(() {
        _singerEntity = list;
        pageTotal = list.data!.totalPage!;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_singerEntity == null) {
      return MyLoadingWidget(
        isShow: true,
        text: "正在加载",
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 80),
          child: Stack(
            children: [
              RefreshIndicator(
                  backgroundColor: Colors.white,
                  displacement: 0,
                  color: Colors.blue,
                  onRefresh: _onRefresh,
                  child: new GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _singerEntity!.data!.list!.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 0.95,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            //查看歌手详情
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SingerInfoPage(singerDataList: _singerEntity!.data!.list![index]),
                            ));
                          },
                          child: Column(
                            children: [
                              new Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: new NetworkImage(
                                              _singerEntity!.data!.list![index].spic!,
                                              headers: map.cast()),
                                          fit: BoxFit.contain),
                                      shape: BoxShape.circle)),
                              new Text(
                                _singerEntity!.data!.list![index].sname!,
                              ),
                            ],
                          ));
                    },
                  )
              ),
              GestureDetector(
                  onTap: () {
                    this._changeData();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: new Container(
                      margin: EdgeInsets.only(top: 20, right: 20),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blueAccent),
                      child: Text(
                        "换一批",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )),
            ],
          )
        ),
      );
    }
  }


}
