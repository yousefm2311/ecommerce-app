// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:ecommerce_app/constance.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'cartProduct.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE $tableCartProduct(
          $columnName TEXT NOT NULL,
          $columnImage TEXT NOT NULL,
          $columnPrice TEXT NOT NULL,
          $columnId TEXT NOT NULL,
          $columnQuantity INTEGER
      )
''');
    });
  }

  Future<List<CartProductModel>> getAllProductCart() async {
    var dbClient = await database;
    if (dbClient == null) {
      return [];
    }

    List<Map> maps = await dbClient.query(
      tableCartProduct,
    );
    // List<CartProductModel> list =
    return maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    // return list;
  }

  Future<void> insert(CartProductModel model) async {
    var dbClient = await database;

    if (dbClient == null) {
      return;
    }
    try {
      await dbClient.insert(
        tableCartProduct,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> update(CartProductModel model) async {
    var dbClient = await database;

    if (dbClient == null) {
      return;
    }
    try {
      await dbClient.update(
        tableCartProduct,
        model.toJson(),
        where: '$columnId = ? ',
        whereArgs: [model.productId],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
