import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/models/save_biegunowa.dart';
import '../data/data_source/save_biegunowa_service.dart';

part 'history_biegunowa_state.dart';
@injectable
class HistoryBiegunowaCubit extends Cubit<HistoryBiegunowaState> {
  HistoryBiegunowaCubit(this.saveBiegunowaService) : super(HistoryBiegunowaInitial());
  final SaveBiegunowaService saveBiegunowaService;
  
  Future<void> saveToDb(String name,List<double> dane,double azymut,List<double>przyrosty,List<double>wyniki)async{
    SaveBiegunowa save = SaveBiegunowa()
    ..dane = dane.map((e) => dane.indexOf(e) <= 3? dane.indexOf(e) % 2 == 0 ? '${e}X' :  '${e}Y': dane.indexOf(e) == 4 ? '${e}g' : '${e}m').toList()
    ..azymut = "${azymut}g"
    ..przyrosty = przyrosty.map((e) => przyrosty.indexOf(e) == 0? '${e}X': '${e}Y').toList()
    ..wyniki = wyniki.map((e) => wyniki.indexOf(e) == 0? '${e}X': '${e}Y').toList()
    ..nazwa = name;
    await saveBiegunowaService.saveData(save);
  }

  Future<void> deleteFromDB(int id) async {
    await saveBiegunowaService.deleteData(id);
  }

  Future<void> closeDB() async {
    await saveBiegunowaService.closeDB();
  }

  Future<void> openDB() async {
    await saveBiegunowaService.openDB();
    emit(HistoryBiegunowaInitial());
  }

  Future<void> getData() async {
    final data = await saveBiegunowaService.getData();
    emit(IGotIt(data));
  }
}