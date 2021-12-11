import 'package:online_shop_ui/constants/constant_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDB {
  static Database db;
  static Future<Database> createDataBase() async {
    if (db != null) {
      return db;
    }
    final path = join(await getDatabasesPath(), 'users_data');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (database, ver) {
        return database.execute(
          'CREATE TABLE $tableName ( $conobjectId TEXT, $conexpireDate TEXT, $consessionToken TEXT)',
        );
      },
    );
    return db;
  }

  static Future insertDataBase(DbModel dataModel) async {
    final db = await createDataBase();
    return db.insert(
      '$tableName',
      dataModel.toMap(),
    );
  }

  static Future callDataBase() async {
    final db = await createDataBase();

    return await db.query('$tableName');

    // return data.map((e) => DbModel.froMap(e));
  }

  static Future deleteDataBase() async {
    final db = await createDataBase();

    return await db.delete('$tableName');

    // return data.map((e) => DbModel.froMap(e));
  }
}

class DbModel {
  String objectId;
  String date;
  String session;

  DbModel({
    this.date,
    this.objectId,
    this.session,
  });

  factory DbModel.froMap(Map<String, dynamic> map) {
    return DbModel(
      date: map[conexpireDate],
      objectId: map[conobjectId],
      session: map[consessionToken],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      conobjectId: objectId,
      conexpireDate: date,
      consessionToken: session,
    };
  }
}
