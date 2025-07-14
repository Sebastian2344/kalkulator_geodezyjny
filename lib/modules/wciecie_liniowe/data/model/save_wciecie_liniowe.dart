// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
part 'save_wciecie_liniowe.g.dart';
@collection
class WciecieLinioweSave {
  Id id = Isar.autoIncrement;
  String name;
  WciecieLinioweModel wciecieLinioweModel;
  WciecieLinioweSave(this.name,this.wciecieLinioweModel);
}
