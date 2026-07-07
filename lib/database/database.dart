import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/tasks_model.dart';

class TaskDatabase{
  static Database? db;

  static Future<Database>getDb()async{
    print(await getDatabasesPath());
    if(db != null) return db!;


    db= await openDatabase(p.join(await getDatabasesPath(), 'todoDb'),onCreate: (db, version){
return db.execute("create table TodoTable(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isComplete INTEGER)");

    }, version: 1);
    return db!;
  }

  static Future<void>insetData(TasksModel taskmodel)async{
    final db= await getDb();
    await db.insert("TodoTable", taskmodel.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<TasksModel>>getData()async{

    final db= await getDb();
    final List<Map<String, dynamic>>maps=await db.query("TodoTable");
    return List.generate(maps.length, (index) => TasksModel.formMap(maps[index]),);
  }

}