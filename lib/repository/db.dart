import 'package:sqflite/sqflite.dart';

class Db {
  static const _dbVersion = 1;
  static const _dbName = 'contacts_db.db';
  static const _tableName = 'contacts';
  static const _sql = '''
  CREATE TABLE $_tableName(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL
  );
''';

  static Future<Database> getInstancia() async {
    final path = '${await getDatabasesPath()} $_dbName';
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute(_sql);
      },
    );
  }
}
