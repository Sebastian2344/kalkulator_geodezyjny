import 'package:injectable/injectable.dart';

import '../data_source/save_wciecie_katowe.dart';
import '../model/save_wciecie_katowe.dart';
import '../model/wciece_katowe_model.dart';
@lazySingleton
class WciecieRepositorySave {
  SaveWciecieKatoweService saveWciecieKatoweService;
  WciecieRepositorySave(this.saveWciecieKatoweService);

  Future<void> save(WciecieKatoweModel wciecieKatoweModel,String nazwa) async {
    final save = WciecieKatoweSave(nazwa,wciecieKatoweModel);
    await saveWciecieKatoweService.saveData(save);
  }

  Future<void> openDB() async {
   await saveWciecieKatoweService.openDB();
  }

  Future<void> deleteData(int id) async {
   await saveWciecieKatoweService.deleteData(id);
  }

  Future<void> closeDb() async {
   await saveWciecieKatoweService.closeDB();
  }

  Future<List<WciecieKatoweSave>> getData() async {
    final data = await saveWciecieKatoweService.getData();
    return data;
  }
}