import 'package:khoroga/constant.dart';
import 'package:khoroga/model/fav_place_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavDatabaseHelper{
  FavDatabaseHelper._();
  static final FavDatabaseHelper db = FavDatabaseHelper._();
  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }
  initDb() async {
    String path= join(await getDatabasesPath(), 'FavPlace.db');
    return await openDatabase(path,
    version:1, onCreate: (Database db, int version) async{
      await db.execute('''
        CREATE TABLE $tableFavPlace (
        $columnName TEXT NOT NULL,
        $columnImgae TEXT NOT NULL,
        $columnBranch TEXT NOT NULL)
      ''');
        }
    );
  }
  insert(FavPlaceModel model)async{
    var dbClient = await database;
    await dbClient.insert(tableFavPlace, model.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<FavPlaceModel>> getAllPlaces() async{
    var dbClient = await database;
  List<Map> maps= await dbClient.query(tableFavPlace);
  List<FavPlaceModel> list= maps.isNotEmpty
      ? maps.map((place) =>FavPlaceModel.fromJson(place)).toList()
      : [];
  return list;
  }

}