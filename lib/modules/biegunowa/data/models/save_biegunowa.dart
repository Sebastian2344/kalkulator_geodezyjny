// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar_community/isar.dart';

part 'save_biegunowa.g.dart';
@collection
class SaveBiegunowa {
  Id id = Isar.autoIncrement;
  String nazwa = '';
  List<String> przyrosty = [];
  List<String> wyniki = [];
  List<String> dane = [];
  String azymut = '';
}