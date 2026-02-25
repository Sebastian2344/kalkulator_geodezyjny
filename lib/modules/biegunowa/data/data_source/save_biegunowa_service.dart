import 'package:injectable/injectable.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/save_biegunowa.dart';
@lazySingleton
class SaveBiegunowaService{
  
  late Future<Isar> db;

  SaveBiegunowaService();
  
  Future<void> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
     if(Isar.instanceNames.isEmpty){
      await Isar.open([SaveBiegunowaSchema], directory: dir.path, name: 'SaveBiegunowa');
     }
    db = Future.value(Isar.getInstance('SaveBiegunowa'));
  }

  Future<List<SaveBiegunowa>> getData() async {
    final isar = await db;
    final query = await isar.saveBiegunowas.where().findAll();
    return query;
  }

  Future<void> saveData(SaveBiegunowa save)async{
   final isar = await db;
   isar.writeTxn(() async {
     await isar.saveBiegunowas.put(save);
   });
  }

  Future<void> deleteData(int id) async {
    final isar = await db;
   isar.writeTxn(() async {
     await isar.saveBiegunowas.delete(id);
   });
  }

  Future<bool> closeDB() async {
    try {
    final isar = await db;
    await isar.close();
    return true; // Baza danych została zamknięta pomyślnie
  } catch (e) {
    return false; // Baza danych nie została zamknięta z powodu błędu
  }
  }
}