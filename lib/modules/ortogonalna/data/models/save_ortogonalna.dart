import 'package:isar/isar.dart';

part 'save_ortogonalna.g.dart';
@collection
class SaveOrtogonalna {
  Id id = Isar.autoIncrement;
  String nazwa = '';
  List<double>? przyrosty;
  List<double>? wyniki;
  List<double>? dane;
  double? azymut;
}