import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/data_source/wciecie_liniowe_service.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/save_wciecie_liniowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/repository/baza_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockSaveWciecieLinioweService extends Mock
    implements SaveWciecieLinioweService {}

class FakeWciecieLinioweModel extends Fake implements WciecieLinioweModel {}

class FakeWciecieLinioweSave extends Fake implements WciecieLinioweSave {}

void main() {
  late WciecieLinioweRepositorySave wciecieLinioweRepositorySave;
  late MockSaveWciecieLinioweService saveWciecieLinioweService;
  late FakeWciecieLinioweModel wciecieLinioweModel;
  late FakeWciecieLinioweSave wciecieLinioweSave;

  setUpAll(() {
    registerFallbackValue(FakeWciecieLinioweSave());
  });

  setUp(() {
    wciecieLinioweSave = FakeWciecieLinioweSave();
    wciecieLinioweModel = FakeWciecieLinioweModel();
    saveWciecieLinioweService = MockSaveWciecieLinioweService();
    wciecieLinioweRepositorySave =
        WciecieLinioweRepositorySave(saveWciecieLinioweService);
  });

  group('repo base tests', () {
    test('delete data', () async {
      when(() => saveWciecieLinioweService.deleteData(any()))
          .thenAnswer((_) async => {});
      await wciecieLinioweRepositorySave.deleteData(1);
      verify(() =>saveWciecieLinioweService.deleteData(any())).called(1);
    });

    test('save data', () async {
      when(() => saveWciecieLinioweService.saveData(any()))
          .thenAnswer((_) async => {});
      await wciecieLinioweRepositorySave.save(wciecieLinioweModel, 'nazwa');
      verify(() => saveWciecieLinioweService.saveData(any())).called(1);
    });

    test('open db', () async {
      when(() => saveWciecieLinioweService.openDB())
          .thenAnswer((_) async => {});
      wciecieLinioweRepositorySave.openDB();
      verify(() => saveWciecieLinioweService.openDB()).called(1);
    });

    test('close db', () async {
      when(() => saveWciecieLinioweService.closeDB())
          .thenAnswer((_) async => true);
      await wciecieLinioweRepositorySave.closeDb();
      verify(() => saveWciecieLinioweService.closeDB()).called(1);
    });

    test('get data', () async {
      when(() => saveWciecieLinioweService.getData())
          .thenAnswer((_) async => <WciecieLinioweSave>[wciecieLinioweSave]);
      final data = await wciecieLinioweRepositorySave.getData();
      expect(data, isA<List<WciecieLinioweSave>>());
      expect(data.length, 1);
      verify(() => saveWciecieLinioweService.getData()).called(1);
    });
  });
}
