import 'package:isar_community/isar.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/save_wciecie_katowe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class SaveWciecieKatoweService{
  
  late Future<Isar> db;

  SaveWciecieKatoweService();

   Future<void> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
     if(Isar.instanceNames.isEmpty){
      await Isar.open([WciecieKatoweSaveSchema], directory: dir.path,name:'SaveWciecieKatowe');
     }
    db = Future.value(Isar.getInstance('SaveWciecieKatowe'));
  }

  Future<List<WciecieKatoweSave>> getData() async {
    final isar = await db;
    final query = await isar.wciecieKatoweSaves.where().findAll();
    return query;
  }

  Future<void> saveData(WciecieKatoweSave save)async{
   final isar = await db;
   isar.writeTxn(() async {
     await isar.wciecieKatoweSaves.put(save);
   });
  }

  Future<void> deleteData(int id) async {
    final isar = await db;
   isar.writeTxn(() async {
     await isar.wciecieKatoweSaves.delete(id);
   });
  }

 Future<bool> closeDB() async {
   final isar = await db;
   return await isar.close();
  }
}