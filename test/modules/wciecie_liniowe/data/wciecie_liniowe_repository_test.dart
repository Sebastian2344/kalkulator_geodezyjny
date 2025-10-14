import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/data_source/obliczenia_liniowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/repository/obliczenia_repo.dart';
import 'package:mocktail/mocktail.dart';
class MockObliczeniaLiniowe extends Mock implements ObliczeniaLiniowe {}
void main(){
  late ObliczeniaLiniowe obliczeniaLiniowe;
  late WciecieLinioweRepository wciecieLinioweRepository;
  setUp((){
    obliczeniaLiniowe = MockObliczeniaLiniowe();
    wciecieLinioweRepository = WciecieLinioweRepository(obliczeniaLiniowe);
  });

  test('oblicz', ()async{
    when(()=> obliczeniaLiniowe.parseToDouble(any())).thenReturn(1);
    when(()=> obliczeniaLiniowe.karnotiany(any(), any(), any(), any())).thenReturn(1);
    when(()=> obliczeniaLiniowe.kwadratyBokow(any())).thenReturn(1);
    when(()=> obliczeniaLiniowe.px4(any(),any(),any())).thenReturn(1);
    when(()=> obliczeniaLiniowe.abc(any(),any(),any(),any(),any(),any(),any(),any(),any())).thenReturn(1);
    when(()=> obliczeniaLiniowe.wynikX(any(),any())).thenReturn(1);
    when(()=> obliczeniaLiniowe.wynikY(any(),any())).thenReturn(1);
     
    final w =  wciecieLinioweRepository.oblicz('1', '1', '1', '1', '1', '1', '1');
    
    expect(w, isA<WciecieLinioweModel>());
  });
}