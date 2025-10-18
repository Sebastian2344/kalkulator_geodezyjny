import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/repository/repo.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieRepository extends Mock implements WciecieRepository {}

void main() {
  late WciecieKatoweCubit cubit;
  late MockWciecieRepository repo;
  setUp(() {
    repo = MockWciecieRepository();
    cubit = WciecieKatoweCubit(repo);
  });

  blocTest('oblicz succesful state',
      build: () {
        when(() => repo.oblicz('1', '1', '1', '1', '45', '45'))
            .thenReturn(WciecieKatoweModel(1, 1));
        return cubit;
      },
      act: (cubit) => cubit.oblicz('1', '1', '1', '1', '45', '45'),
      expect: () {
        return [isA<WciecieKatoweSuccesful>().having((e)=> e.wciecieKatoweModel, 'model', isA<WciecieKatoweModel>())];
      },
      verify: (cubit) {
        verify(() => repo.oblicz('1', '1', '1', '1', '45', '45')).called(1);
      });

  blocTest('oblicz error state',
      build: () => cubit,
      act: (cubit) {
        when(() => repo.oblicz('a', '1', '1', '1', '45', '45'))
            .thenThrow(FormatException());
        cubit.oblicz('a', '1', '1', '1', '45', '45');
      },
      expect: () {
        return [isA<WciecieKatoweError>()];
      },
      verify: (cubit) {
        verify(() => repo.oblicz('a', '1', '1', '1', '45', '45')).called(1);
      });

  blocTest('reset state',
      build: () => cubit,
      act: (cubit) {
        cubit.resetState();
      },
      expect: () {
        return [WciecieKatoweInitial()];
      },
      verify: (cubit) {
        verifyNoMoreInteractions(repo);
      });
}
