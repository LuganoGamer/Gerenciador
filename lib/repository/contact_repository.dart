import 'package:flutter_application_1/model/contact.dart';
import 'package:flutter_application_1/repository/db.dart';

class ContactRepository {
  static const _tableName = 'contacts';

  Future<int> insert(Map<String, Object?> map) async {
    final db = await Db.getInstancia();
    return await db.insert(_tableName, map);
  }

  Future<List<Contact>> findAll() async {
    final db = await Db.getInstancia();
    final result = await db.query(_tableName);
    return result
        .map(
          (item) => Contact.fromMap(item),
        )
        .toList();
  }

  Future<int> update(Map<String, Object?> map) async {
    final db = await Db.getInstancia();
    return await db
        .update(_tableName, map, where: 'id=?', whereArgs: [map['id']]);
  }

//testar
  Future<int> delete(int id) async {
    final db = await Db.getInstancia();
    return await db.delete(
      _tableName,
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
