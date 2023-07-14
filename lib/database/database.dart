import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{

  final String path = join(await getDatabasesPath(), 'db');

  return openDatabase(
      path,
      onCreate: (db, version){
        db.execute('CREATE TABLE User (id INTEGER PRIMARY KEY, nome TEXT, email TEXT, password TEXT) ');
        db.execute('CREATE TABLE LOGIN (id INTEGER PRIMARY KEY, login TEXT, password TEXT, permissao TEXT, token TEXT) ');
      },
      version: 1);

}