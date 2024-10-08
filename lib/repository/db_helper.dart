import 'package:flutter_application_1/model/ValorModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  static Database? _database;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'valores.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE valores(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            valor REAL
          )
      ''');
      },
    );
  }

  /*Future<int> inserirValor(ValorModel valor) async {
    Database db = await database;
    return await db.insert('valores', valor.toMap());
  }*/

  //testar

  Future<int> inserirValor(ValorModel valor) async {
    try{
      Database db = await database;
      return await db.insert('valores', valor.toMap());
    }
    catch (e) {
      print("Erro ao inserir valor: $e");
      return -1;
    }
  }

  Future<List<ValorModel>> getValores() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('valores');
    return List.generate(maps.length, (i) {
      return ValorModel.fromMap(maps[i]);
    });
  }

  Future<void> deleteAll() async {
    Database db = await database;
    await db.delete('valores');
  }

//testar

  Future<void> registrarValor(double valor) async {
    ValorModel novoValor = ValorModel(valor);
    int id = await DbHelper().inserirValor(novoValor);
    print("Valor registrado com ID: $id");
  }
}
