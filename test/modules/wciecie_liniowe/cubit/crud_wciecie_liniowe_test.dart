import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/crud_wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/save_wciecie_liniowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/repository/baza_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieLinioweRepositorySave extends Mock
    implements WciecieLinioweRepositorySave {}

class FakeWciecieLinioweModel extends Fake implements WciecieLinioweModel {}

void main() {
  late MockWciecieLinioweRepositorySave mockWciecieLinioweRepositorySave;
  late CrudWciecieLinioweCubit crudWciecieLinioweCubit;
  late FakeWciecieLinioweModel fakeWciecieLinioweModel;
  setUp(() {
    mockWciecieLinioweRepositorySave = MockWciecieLinioweRepositorySave();
    crudWciecieLinioweCubit =
        CrudWciecieLinioweCubit(mockWciecieLinioweRepositorySave);
    fakeWciecieLinioweModel = FakeWciecieLinioweModel();
  });
  tearDown(() {});
  setUpAll((){
    registerFallbackValue(FakeWciecieLinioweModel());
  });

  test('save', () async {
    when(() => mockWciecieLinioweRepositorySave.save(any(), any()))
        .thenAnswer((_) async => {});
    await crudWciecieLinioweCubit.saveData(fakeWciecieLinioweModel, 'nazwa');
    verify(() => mockWciecieLinioweRepositorySave.save(any(), any())).called(1);
  });

  test('delete data', () async {
    when(
      () => mockWciecieLinioweRepositorySave.deleteData(any()),
    ).thenAnswer((_) async => {});
    await crudWciecieLinioweCubit.deleteData(1);
    verify(() => mockWciecieLinioweRepositorySave.deleteData(any())).called(1);
  });

  test('close db', () async {
    when(() => mockWciecieLinioweRepositorySave.closeDb())
        .thenAnswer((_) async => {});
    await crudWciecieLinioweCubit.closeDB();
    verify(() => mockWciecieLinioweRepositorySave.closeDb()).called(1);
  });

  test('open db', () async {
    when(() => mockWciecieLinioweRepositorySave.openDB())
        .thenAnswer((_) async => {});
    await crudWciecieLinioweCubit.openDB();
    verify(() => mockWciecieLinioweRepositorySave.openDB()).called(1);
  });

  blocTest(
    'reset state return initial state',
    build: () => crudWciecieLinioweCubit,
    act: (cubit) => cubit.resetState(),
    expect: () => [isA<CrudWciecieLinioweInitial>()],
  );

  blocTest(
    'succes state after get data',
    build: () {
      when(() => mockWciecieLinioweRepositorySave.getData()).thenAnswer(
          (_) async => [WciecieLinioweSave('name', FakeWciecieLinioweModel())]);
      return crudWciecieLinioweCubit;
    },
    act: (cubit) => cubit.getData(),
    expect: () => [
      isA<CrudWciecieLinioweGetSuccessful>()
          .having((e) => e.wciecieLinioweSaveList, 'lista savów',
              isA<List<WciecieLinioweSave>>())
          .having(
              (e) => e.wciecieLinioweSaveList[0].name, 'string "name" ', 'name')
          .having((e) => e.wciecieLinioweSaveList[0].wciecieLinioweModel,
              'is model', isA<FakeWciecieLinioweModel>())
    ],
    verify: (_) => verify(() => mockWciecieLinioweRepositorySave.getData(),).called(1)
  );

  blocTest(
    'error state after error',
    build: () {
      when(() => mockWciecieLinioweRepositorySave.getData())
          .thenThrow(Exception("fucking error"));
      return crudWciecieLinioweCubit;
    },
    act: (cubit) => cubit.getData(),
    expect: () => [
      isA<CrudWciecieLinioweGetError>()
          .having((e) => e.error, 'message', "Exception: fucking error")
    ],
    verify: (_) => verify(() => mockWciecieLinioweRepositorySave.getData(),).called(1)
  );
}
