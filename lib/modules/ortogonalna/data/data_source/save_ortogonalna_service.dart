import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/save_ortogonalna.dart';
@lazySingleton
class SaveOrtogonalnaService{
  
  late Future<Isar> db;

  SaveOrtogonalnaService();

   Future<void> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
     if(Isar.instanceNames.isEmpty){
      await Isar.open([SaveOrtogonalnaSchema], directory: dir.path,name:'SaveOrtogonalna');
     }
    db = Future.value(Isar.getInstance('SaveOrtogonalna'));
  }

  Future<List<SaveOrtogonalna>> getData() async {
    final isar = await db;
    final query = await isar.saveOrtogonalnas.where().findAll();
    return query;
  }

  Future<void> saveData(SaveOrtogonalna save)async{
   final isar = await db;
   isar.writeTxn(() async {
     await isar.saveOrtogonalnas.put(save);
   });
  }

  Future<void> deleteData(int id) async {
    final isar = await db;
   isar.writeTxn(() async {
     await isar.saveOrtogonalnas.delete(id);
   });
  }

 Future<bool> closeDB() async {
   final isar = await db;
   return await isar.close();
  }
}