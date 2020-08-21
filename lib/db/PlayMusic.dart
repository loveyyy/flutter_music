
class PlayMusic{
  int id ;
  String musicId;
  String pic;
  String musicName;
  String singer;
  int duration;
  String album;
  String albumPic;
  String rid;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "musicId": musicId,
      "pic": pic,
      "musicName": musicName,
      "singer": singer,
      "duration": duration,
      "album": album,
      "albumPic": albumPic,
      "rid": rid,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  PlayMusic(this.musicId,this.singer,this.musicName,this.duration,this.album,this.albumPic,this.pic,this.rid);

  PlayMusic.fromMap(Map<String, dynamic> map) {
      id = map['id'];
      musicId = map['musicId'];
      pic = map['pic'];
      musicName = map['musicName'];
      singer = map['singer'];
      duration = map['duration'];
      album = map['album'];
      albumPic = map['albumPic'];
      rid = map['rid'];
  }

}