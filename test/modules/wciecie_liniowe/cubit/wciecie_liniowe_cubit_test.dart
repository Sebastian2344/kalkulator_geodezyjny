import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/repository/obliczenia_repo.dart';
import 'package:mocktail/mocktail.dart';
class MockWciecieLinioweRepository extends Mock implements WciecieLinioweRepository {}
void main(){
  late WciecieLinioweCubit wciecieLinioweCubit;
  late MockWciecieLinioweRepository mockWciecieLinioweRepository;

  setUp((){
    mockWciecieLinioweRepository = MockWciecieLinioweRepository();
    wciecieLinioweCubit = WciecieLinioweCubit(mockWciecieLinioweRepository);
  });

  tearDown((){
    wciecieLinioweCubit.close();
  });

  blocTest<WciecieLinioweCubit, WciecieLinioweState>(
    'emits [WciecieLinioweInitial] when resetState is called',
    build: () => wciecieLinioweCubit,
    act: (cubit) => cubit.resetState(),
    expect: () => [isA<WciecieLinioweInitial>()],
    verify: (_) {
      verifyNoMoreInteractions(mockWciecieLinioweRepository);
    },
  );

  blocTest<WciecieLinioweCubit, WciecieLinioweState>(
    'emits [WciecieLinioweSuccessful] when oblicz is called with valid parameters',
    build: () {
      when(() => mockWciecieLinioweRepository.oblicz(any(), any(), any(), any(), any(), any(), any()))
          .thenReturn(WciecieLinioweModel());
      return wciecieLinioweCubit;
    },
    act: (cubit) => cubit.oblicz('1', '2', '3', '4', '5', '6', '7'),
    expect: () => [isA<WciecieLinioweSuccessful>().having((e)=> e.wciecieLinioweModel, 'model', isA<WciecieLinioweModel>())],
    verify: (_) {
      verify(() => mockWciecieLinioweRepository.oblicz(any(), any(), any(), any(), any(), any(), any())).called(1);
    },
  );

  blocTest<WciecieLinioweCubit, WciecieLinioweState>(
    'emits [WciecieLinioweError] when oblicz throws an exception',
    build: () {
      when(() => mockWciecieLinioweRepository.oblicz(any(), any(), any(), any(), any(), any(), any()))
          .thenThrow(Exception('Test Exception'));
      return wciecieLinioweCubit;
    },
    act: (cubit) => cubit.oblicz('1', '2', '3', '4', '5', '6', '7'),
    expect: () => [isA<WciecieLinioweError>().having((e)=>e.error, 'error mesage', contains('Test Exception'))],
    verify: (_) {
      verify(() => mockWciecieLinioweRepository.oblicz(any(), any(), any(), any(), any(), any(), any())).called(1);
    },
  );
}