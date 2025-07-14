import 'package:isar/isar.dart';
import 'wciece_katowe_model.dart';

part 'save_wciecie_katowe.g.dart';
@collection
class WciecieKatoweSave{
  Id id = Isar.autoIncrement;
  String nazwa;
  final WciecieKatoweModel wciecieKatoweModel;

  WciecieKatoweSave(this.nazwa,this.wciecieKatoweModel);
}