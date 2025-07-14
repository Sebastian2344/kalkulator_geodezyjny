import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

import '../model/save_wciecie_liniowe.dart';
@lazySingleton
class SaveWciecieLinioweService{
  
  late Future<Isar> db;

  SaveWciecieLinioweService();

   Future<void> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
     if(Isar.instanceNames.isEmpty){
      await Isar.open([WciecieLinioweSaveSchema], directory: dir.path,name:'SaveWciecieLiniowe');
     }
    db = Future.value(Isar.getInstance('SaveWciecieLiniowe'));
  }

  Future<List<WciecieLinioweSave>> getData() async {
    final isar = await db;
    List<WciecieLinioweSave> query = [];
    isar.txn(() async => query = await isar.wciecieLinioweSaves.where().findAll());
    return query;
  }

  Future<void> saveData(WciecieLinioweSave save)async{
   final isar = await db;
   isar.writeTxn(() async {
     await isar.wciecieLinioweSaves.put(save);
   });
  }

  Future<void> deleteData(int id) async {
    final isar = await db;
   isar.writeTxn(() async {
     await isar.wciecieLinioweSaves.delete(id);
   });
  }

 Future<bool> closeDB() async {
   final isar = await db;
   return await isar.close();
  }
}