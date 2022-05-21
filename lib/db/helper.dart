import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:justfactsinhindi/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late Database db;
  List category = [];
  List homeCategory = [];

  Future databaseGet() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "FactsinHindi.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "FactsinHindi.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    // open the database
    var db = await openDatabase(path);
    // category = await db.query('facts');
     category = await db.rawQuery("SELECT DISTINCT sub_cate FROM facts WHERE Cate='$categoryName'");


     homeCategory = await db.rawQuery("SELECT * FROM facts WHERE sub_cate='$fact'");

    // homeCategory =  await db.query('REMEDIE_TYPE');
    if (kDebugMode) {
      print(category.length);
      print(homeCategory.length);





    }
  }
}