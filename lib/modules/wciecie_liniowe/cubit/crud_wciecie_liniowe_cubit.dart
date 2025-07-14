import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../data/model/save_wciecie_liniowe.dart';
import '../data/model/wciecie_liniowe_model.dart';
import '../data/repository/baza_repo.dart';

part 'crud_wciecie_liniowe_state.dart';
@injectable
class CrudWciecieLinioweCubit extends Cubit<CrudWciecieLinioweState> {
  CrudWciecieLinioweCubit(this.saveRepo) : super(CrudWciecieLinioweInitial());
  final WciecieLinioweRepositorySave  saveRepo;

  Future<void> saveData(WciecieLinioweModel wciecieKatoweModel,String nazwa) async {
   await saveRepo.save(wciecieKatoweModel,nazwa);
  }

  Future<void> deleteData(int id) async {
    await saveRepo.deleteData(id);
  }

  Future<void> closeDB() async {
    await saveRepo.closeDb();
  }

  Future<void> openDB() async {
    emit(CrudWciecieLinioweInitial());
    await saveRepo.openDB();
  }

  Future<void> getData() async {
    try{
      final data = await saveRepo.getData();
      emit(CrudWciecieLinioweGetSuccessful(data));
    }catch(e){
      emit(CrudWciecieLinioweGetError(e.toString()));
    }  
  }

  void resetState(){
    emit(CrudWciecieLinioweInitial());
  }
}
