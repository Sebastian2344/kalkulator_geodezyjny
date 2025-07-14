import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/data_source/save_ortogonalna_service.dart';
import '../data/models/save_ortogonalna.dart';
part 'history_ortogonalna_state.dart';

@injectable
class HistoryOrtogonalnaCubit extends Cubit<HistoryOrtogonalnaState> {
  HistoryOrtogonalnaCubit(this.saveOrtogonalnaService) : super(HistoryOrtogonalnaInitial());
  final SaveOrtogonalnaService saveOrtogonalnaService;
  
  Future<void> saveToDb(String name,List<double> dane,double azymut,List<double>przyrosty,List<double>wyniki)async{
    SaveOrtogonalna save = SaveOrtogonalna()
    ..dane = dane
    ..azymut = azymut
    ..przyrosty = przyrosty
    ..wyniki = wyniki
    ..nazwa = name;
    await saveOrtogonalnaService.saveData(save);
  }

  Future<void> getFromDb() async {
    final data = await saveOrtogonalnaService.getData();
    emit(IGotIt(data));
  }

  void resetState(){
    emit(HistoryOrtogonalnaInitial());
  }

  Future<void> deleteFromDB(int id) async {
    await saveOrtogonalnaService.deleteData(id);
  }

  Future<void> closeDB() async {
    await saveOrtogonalnaService.closeDB();
  }

  Future<void> openDB() async {
    await saveOrtogonalnaService.openDB();
    emit(HistoryOrtogonalnaInitial());
  }
}