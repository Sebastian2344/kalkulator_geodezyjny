import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/data_source/obliczenia_ortogonalna.dart';
import 'package:equatable/equatable.dart';
part 'ortogonalna_state.dart';
@injectable
class OrtogonalnaCubit extends Cubit<OrtogonalnaState> {
  OrtogonalnaCubit({required this.obliczenia}) : super(OrtogonalnaInitial());
  final ObliczeniaOrtogonalna obliczenia;
  void wynikOrtogonalnej(String wsX,String wsY,String wnX,String wnY,String bierzaca,String domiar){
    try{
      final daneparse = obliczenia.parseToDouble(wsX, wsY, wnX, wnY, bierzaca, domiar);
      final azymut = obliczenia.azymut(wsX:daneparse[0],wsY:daneparse[1],wnX:daneparse[2],wnY:daneparse[3]);
      final wyniki = obliczenia.wynikOrtogonalnej(wsX:daneparse[0],wsY:daneparse[1],bierzaca:daneparse[4],domiar:daneparse[5],azymut:azymut);
      emit(OrtogonalnaSuccesful(wyniki[0],wyniki[1],daneparse,wyniki[0][2]));
    }on FormatException{
      emit(OrtogonalnaError('Podałeś złe dane!! Upewnij się czy nie ma literówki oraz czy wszystkie pola są uzupełnione.Następnie kliknij oblicz.'));
    }
  }
  void resetState(){
    emit(OrtogonalnaInitial());
  }
}