
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';

import '../data/repository/repo.dart';

part 'wciecie_katowe_state.dart';
@injectable
class WciecieKatoweCubit extends Cubit<WciecieKatoweState> {
  WciecieKatoweCubit(this.wciecieRepository) : super(WciecieKatoweInitial());
  final WciecieRepository wciecieRepository;
  
   void oblicz(String xAS,String yAS,String xBS,String yBS,String alfaAngleS,String betaAngleS){
    try{
      final solvedExample = wciecieRepository.oblicz(xAS, yAS, xBS, yBS, alfaAngleS, betaAngleS);
      emit(WciecieKatoweSuccesful(solvedExample));
    }on FormatException catch(e){
      emit(WciecieKatoweError(e.toString()));
    }   
  }
  
  void resetState(){
    emit(WciecieKatoweInitial());
  }
}
