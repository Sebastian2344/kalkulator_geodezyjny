import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:isar/isar.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/data_source/save_biegunowa_service.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/models/save_biegunowa.dart';

// Mocki
class MockIsar extends Mock implements Isar {}
class MockSaveBiegunowaCollection extends Mock implements IsarCollection<SaveBiegunowa> {}
class MockQueryBuilder extends Mock implements QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhere> {}

void main() {
  late SaveBiegunowaService service;
  late MockIsar mockIsar;
  late MockSaveBiegunowaCollection mockCollection;
  late MockQueryBuilder mockQueryBuilder;

  setUp(() {
    mockIsar = MockIsar();
    mockCollection = MockSaveBiegunowaCollection();
    mockQueryBuilder = MockQueryBuilder();

    // Mock kolekcji
    when(() => mockIsar.saveBiegunowas).thenReturn(mockCollection);

    service = SaveBiegunowaService();
    service.db = Future.value(mockIsar);
  });

  test('getData returns data from collection', () async {
    final fakeList = [SaveBiegunowa()..id = 1];
    when(() => mockCollection.where()).thenReturn(mockQueryBuilder as QueryBuilder<SaveBiegunowa, SaveBiegunowa, QWhere>);
    when(() => mockQueryBuilder.findAll()).thenAnswer((_) async => fakeList);

    final result = await service.getData();

    expect(result, fakeList);
    verify(() => mockCollection.where()).called(1);
    verify(() => mockQueryBuilder.findAll()).called(1);
  });

  test('saveData calls put on collection', () async {
    final save = SaveBiegunowa()..id = 2;
    when(() => mockIsar.writeTxn(any())).thenAnswer((invocation) async {
      await invocation.positionalArguments[0]();
      return Future.value();
    });
    when(() => mockCollection.put(save)).thenAnswer((_) async => 2);

    await service.saveData(save);

    verify(() => mockIsar.writeTxn(any())).called(1);
    verify(() => mockCollection.put(save)).called(1);
  });

  test('deleteData calls delete on collection', () async {
    when(() => mockIsar.writeTxn(any())).thenAnswer((invocation) async {
      return await invocation.positionalArguments[0]();
    });
    when(() => mockCollection.delete(3)).thenAnswer((_) async => true);

    await service.deleteData(3);

    verify(() => mockIsar.writeTxn(any())).called(1);
    verify(() => mockCollection.delete(3)).called(1);
  });
}