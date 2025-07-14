import 'package:injectable/injectable.dart';

import '../data_source/wciecie_liniowe_service.dart';
import '../model/save_wciecie_liniowe.dart';
import '../model/wciecie_liniowe_model.dart';

@lazySingleton
class WciecieLinioweRepositorySave {
  SaveWciecieLinioweService saveWciecieLinioweService;
  WciecieLinioweRepositorySave(this.saveWciecieLinioweService);

  Future<void> save(WciecieLinioweModel wciecieLinioweModel,String nazwa) async {
    final save = WciecieLinioweSave(nazwa,wciecieLinioweModel);
    await saveWciecieLinioweService.saveData(save);
  }

  Future<void> openDB() async {
   await saveWciecieLinioweService.openDB();
  }

  Future<void> deleteData(int id) async {
   await saveWciecieLinioweService.deleteData(id);
  }

  Future<void> closeDb() async {
   await saveWciecieLinioweService.closeDB();
  }

  Future<List<WciecieLinioweSave>> getData() async {
    final data = await saveWciecieLinioweService.getData();
    return data;
  }
}