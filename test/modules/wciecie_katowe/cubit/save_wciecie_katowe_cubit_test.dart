import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/save_wciecie_katowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/repository/save_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieRepositorySave extends Mock implements WciecieRepositorySave {}

class MockWciecieKatoweModel extends Mock implements WciecieKatoweModel {}

void main() {
  late HistoryWciecieKatoweCubit cubit;
  late MockWciecieRepositorySave repo;
  late MockWciecieKatoweModel model;
  setUp(() {
    repo = MockWciecieRepositorySave();
    cubit = HistoryWciecieKatoweCubit(repo);
    model = MockWciecieKatoweModel();
  });

  setUpAll(() {
    registerFallbackValue(MockWciecieKatoweModel());
  });

  blocTest('openDb',
      build: () { 
        when(() => repo.openDB()).thenAnswer((_) async {});
        return cubit;
      },
      act: (cubit) => cubit.openDB(),
      expect: () => [HistoryWciecieKatoweInitial()],
      verify: (cubit) {
        verify(() => repo.openDB()).called(1);
      });

  blocTest('reset state',
      build: () => cubit,
      act: (cubit) {
        cubit.resetState();
      },
      expect: () => [HistoryWciecieKatoweInitial()]);

  blocTest('get data succes',
      build: () { 
        when(() => repo.getData()).thenAnswer((_) async => [WciecieKatoweSave('nazwa', WciecieKatoweModel())]);
        return cubit;
      },
      act: (cubit) => cubit.getData(),
      expect: () => [isA<HistoryWciecieKatoweGetSuccesful>().having((e)=> e.saveList, 'savelist', isA<List<WciecieKatoweSave>>())],
      verify: (cubit) {
        verify(() => repo.getData()).called(1);
      });

  blocTest('get data error',
      build: () {
        when(() => repo.getData()).thenThrow(Exception('error'));
        return cubit;
      },
      act: (cubit) => cubit.getData(),
      expect: () => [HistoryWciecieKatoweGetError('Exception: error')],
      verify: (cubit) {
        verify(() => repo.getData()).called(1);
      });

  test('save data', () async {
    when(() => repo.save(any(), any())).thenAnswer((_) async {});
    await cubit.saveData(model, 'test');
    verify(() => repo.save(any(), any())).called(1);
  });

  test('delete data', () async {
    when(() => repo.deleteData(1)).thenAnswer((_) async {});
    await cubit.deleteData(1);
    verify(() => repo.deleteData(1)).called(1);
  });

  test('close db', () async {
    when(() => repo.closeDb()).thenAnswer((_) async {});
    await cubit.closeDB();
    verify(() => repo.closeDb()).called(1);
  });
}
