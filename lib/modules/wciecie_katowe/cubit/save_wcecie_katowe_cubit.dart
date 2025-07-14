import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../data/model/save_wciecie_katowe.dart';
import '../data/model/wciece_katowe_model.dart';
import '../data/repository/save_repo.dart';

part 'save_wcecie_katowe_state.dart';
@injectable
class HistoryWciecieKatoweCubit extends Cubit<HistoryWciecieKatoweState> {
  HistoryWciecieKatoweCubit(this.saveRepo) : super(HistoryWciecieKatoweInitial());
  final WciecieRepositorySave saveRepo;
  
  Future<void> saveData(WciecieKatoweModel wciecieKatoweModel,String nazwa) async {
   await saveRepo.save(wciecieKatoweModel,nazwa);
  }

  Future<void> deleteData(int id) async {
    await saveRepo.deleteData(id);
  }

  Future<void> closeDB() async {
    await saveRepo.closeDb();
  }

  Future<void> openDB() async {
    emit(HistoryWciecieKatoweInitial());
    await saveRepo.openDB();
  }

  Future<void> getData() async {
    try{
      final data = await saveRepo.getData();
      emit(HistoryWciecieKatoweGetSuccesful(data));
    }catch(e){
      emit(HistoryWciecieKatoweGetError(e.toString()));
    }  
  }

  void resetState(){
    emit(HistoryWciecieKatoweInitial());
  }
}
