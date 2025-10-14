import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/data_source/save_wciecie_katowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/save_wciecie_katowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/repository/save_repo.dart';
import 'package:mocktail/mocktail.dart';
class MockSaveWciecieKatoweService extends Mock implements SaveWciecieKatoweService {}
class FakeWciecieKatoweModel extends Fake implements WciecieKatoweModel {}

class FakeWciecieKatoweSave extends Fake implements WciecieKatoweSave {}
void main(){
  late SaveWciecieKatoweService saveWciecieKatoweService;
  late WciecieRepositorySave wciecieKatoweSaveRepo;
  late FakeWciecieKatoweModel wciecieKatoweModel;
  late FakeWciecieKatoweSave wciecieKatoweSave;

  setUpAll((){
    registerFallbackValue(FakeWciecieKatoweSave());
  });

  setUp((){
    wciecieKatoweModel = FakeWciecieKatoweModel();
    wciecieKatoweSave = FakeWciecieKatoweSave();
    saveWciecieKatoweService = MockSaveWciecieKatoweService();
    wciecieKatoweSaveRepo = WciecieRepositorySave(saveWciecieKatoweService);
  });
  group('repo base tests', () {
    test('delete data', () async {
      when(() => saveWciecieKatoweService.deleteData(any()))
          .thenAnswer((_) async => {});
      await wciecieKatoweSaveRepo.deleteData(1);
      verify(() =>saveWciecieKatoweService.deleteData(any())).called(1);
    });

    test('save data', () async {
      when(() => saveWciecieKatoweService.saveData(any()))
          .thenAnswer((_) async => {});
      await wciecieKatoweSaveRepo.save(wciecieKatoweModel, 'nazwa');
      verify(() => saveWciecieKatoweService.saveData(any())).called(1);
    });

    test('open db', () async {
      when(() => saveWciecieKatoweService.openDB())
          .thenAnswer((_) async => {});
      wciecieKatoweSaveRepo.openDB();
      verify(() => saveWciecieKatoweService.openDB()).called(1);
    });

    test('close db', () async {
      when(() => saveWciecieKatoweService.closeDB())
          .thenAnswer((_) async => true);
      await wciecieKatoweSaveRepo.closeDb();
      verify(() => saveWciecieKatoweService.closeDB()).called(1);
    });

    test('get data', () async {
      when(() => saveWciecieKatoweService.getData())
          .thenAnswer((_) async => <WciecieKatoweSave>[wciecieKatoweSave]);
      final data = await wciecieKatoweSaveRepo.getData();
      expect(data, isA<List<WciecieKatoweSave>>());
      expect(data.length, 1);
      verify(() => saveWciecieKatoweService.getData()).called(1);
    });
  });
}