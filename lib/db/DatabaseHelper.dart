import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'PlayMusic.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String dbName = 'play_music';

  final String id = 'id';
  final String musicId = 'musicId';
  final String pic = 'pic';
  final String musicName = 'musicName';
  final String singer = 'singer';
  final String duration = 'duration';
  final String album = 'album';
  final String albumPic = 'albumPic';
  final String rid = 'rid';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'music.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $dbName($id INTEGER PRIMARY KEY AUTOINCREMENT,$musicId TEXT, $pic TEXT, $musicName TEXT,$singer TEXT, $duration INTEGER, $rid TEXT, $albumPic TEXT,$album TEXT)');
  }

  Future<PlayMusic> insertPlayMusic(PlayMusic playMusic) async {
    var dbClient = await db;
    playMusic.id = await dbClient.insert(dbName, playMusic.toMap());
    return playMusic;
  }

  Future<List<PlayMusic>> selectPlayMusic() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(
      dbName,
      columns: [id, musicId, pic, musicName, singer, duration,album,albumPic,rid]
    );
    if(maps.length>0){
      List<PlayMusic> playMusicList = [];
      maps.forEach((item) =>playMusicList.add(PlayMusic.fromMap(item)));
      return playMusicList;
    }
    return null;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $dbName'));
  }

  Future<PlayMusic> getPlayMusic(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(dbName,
        columns: [musicId, pic, musicName, singer, dbName,album,albumPic,rid],
        where: '$id = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return PlayMusic.fromMap(result.first);;
    }

    return null;
  }

  Future<int> deletePlayMusic(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(dbName, where: '$id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllPlayMusic() async {
    var dbClient = await db;
    return await dbClient
        .delete(dbName);
  }

//
//  Future<int> updateNote(Video video) async {
//    var dbClient = await db;
//    return await dbClient.update(tableVideo, video.toJson(),
//        where: "$columnId = ?", whereArgs: [video.id]);
//  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}