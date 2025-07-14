import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/data_source/obliczenia_biegunowa.dart';

part 'biegunowa_state.dart';
@injectable
class BiegunowaCubit extends Cubit<BiegunowaState> {
  BiegunowaCubit({required this.obliczenia}) : super(BiegunowaInitial());
  final ObliczeniaBiegunowa obliczenia;

 final TextEditingController _textEditingController = TextEditingController();
 final TextEditingController _textEditingController2 = TextEditingController();
 final TextEditingController _textEditingController3 = TextEditingController();
 final TextEditingController _textEditingController4 = TextEditingController();
 final TextEditingController _textEditingController5 = TextEditingController();
 final TextEditingController _textEditingController6 = TextEditingController();
 final TextEditingController _textEditingController7 = TextEditingController();

  void wynikbiegunowej(String wsX,String wsY,String wnX,String wnY,String az,String odl){
    try{
      final daneparse = obliczenia.parsetodouble(wsX:wsX, wsY:wsY, wnX:wnX, wnY:wnY, az:az, odl:odl);
      final azymut = obliczenia.azymut(wsX:daneparse[0], wsY:daneparse[1], wnX:daneparse[2], wnY:daneparse[3]);
      final wyniki = obliczenia.wynikbiegunowej(wsX:daneparse[0],wsY:daneparse[1],az:daneparse[4],odl:daneparse[5],azAb:azymut);
      emit(BiegunowaSuccesful([wyniki[3],wyniki[4]],[wyniki[1],wyniki[2]],daneparse,wyniki[0]));
    }on FormatException{
      emit(BiegunowaError('Podałeś złe dane!! Upewnij się czy nie ma literówki oraz czy wszystkie pola są uzupełnione.Następnie kliknij oblicz.'));
    }
  }

  TextEditingController getController(){
    return _textEditingController;
  }
  TextEditingController getController2(){
    return _textEditingController2;
  }
  TextEditingController getController3(){
    return _textEditingController3;
  }
  TextEditingController getController4(){
    return _textEditingController4;
  }
  TextEditingController getController5(){
    return _textEditingController5;
  }
  TextEditingController getController6(){
    return _textEditingController6;
  }
  TextEditingController getController7(){
    return _textEditingController7;
  }

  void resetState(){
    _textEditingController.clear();
    _textEditingController2.clear();
    _textEditingController3.clear();
    _textEditingController4.clear();
    _textEditingController5.clear();
    _textEditingController6.clear();
    _textEditingController7.clear();
    emit(BiegunowaInitial());
  }


  @override
  Future<void> close() async {
    _textEditingController.dispose();
    _textEditingController2.dispose();
    _textEditingController3.dispose();
    _textEditingController4.dispose();
    _textEditingController5.dispose();
    _textEditingController6.dispose();
    _textEditingController7.dispose();
    super.close();
  }
}
