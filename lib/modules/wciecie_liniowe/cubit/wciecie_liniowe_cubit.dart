import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../data/model/wciecie_liniowe_model.dart';
import '../data/repository/obliczenia_repo.dart';

part 'wciecie_liniowe_state.dart';
@injectable
class WciecieLinioweCubit extends Cubit<WciecieLinioweState> {
  WciecieLinioweCubit(this.wciecieLinioweRepository) : super(WciecieLinioweInitial());
  final WciecieLinioweRepository wciecieLinioweRepository;
  
  void oblicz(String xAS,String yAS,String xBS,String yBS,String apS,String bpS,String abS){
    try{
      final wciecieLinioweModel = wciecieLinioweRepository.oblicz(xAS, yAS, xBS, yBS, apS, bpS, abS);
      emit(WciecieLinioweSuccessful(wciecieLinioweModel));
    }catch(e){
      emit(WciecieLinioweError(e.toString()));
    } 
  }
  
  void resetState(){
    emit(WciecieLinioweInitial());
  }
}
