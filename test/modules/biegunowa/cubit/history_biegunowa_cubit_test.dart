import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/cubit/history_biegunowa_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/models/save_biegunowa.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/data_source/save_biegunowa_service.dart';

class MockSaveBiegunowaService extends Mock implements SaveBiegunowaService {}

void main() {
  late MockSaveBiegunowaService mockService;
  late HistoryBiegunowaCubit cubit;

  setUp(() {
    mockService = MockSaveBiegunowaService();
    cubit = HistoryBiegunowaCubit(mockService);
    registerFallbackValue(SaveBiegunowa());
  });

  test('saveToDb calls saveData on service', () async {
    when(() => mockService.saveData(any())).thenAnswer((_) async {});
    await cubit.saveToDb('test', [1, 2, 3, 4, 5, 6], 7, [8, 9], [10, 11]);
    verify(() => mockService.saveData(any())).called(1);
  });

  test('deleteFromDB calls deleteData on service', () async {
    when(() => mockService.deleteData(1)).thenAnswer((_) async {});
    await cubit.deleteFromDB(1);
    verify(() => mockService.deleteData(1)).called(1);
  });

  test('closeDB calls closeDB on service', () async {
    when(() => mockService.closeDB()).thenAnswer((_) async => true);
    await cubit.closeDB();
    verify(() => mockService.closeDB()).called(1);
  });

  blocTest<HistoryBiegunowaCubit, HistoryBiegunowaState>(
    'openDB emits HistoryBiegunowaInitial',
    build: () {
      when(() => mockService.openDB()).thenAnswer((_) async {});
      return HistoryBiegunowaCubit(mockService);
    },
    act: (cubit) => cubit.openDB(),
    expect: () => [isA<HistoryBiegunowaInitial>()],
  );

  blocTest<HistoryBiegunowaCubit, HistoryBiegunowaState>(
    'getData emits IGotIt with data from service',
    build: () {
      when(() => mockService.getData())
          .thenAnswer((_) async => [SaveBiegunowa()..id = 1]);
      return HistoryBiegunowaCubit(mockService);
    },
    act: (cubit) => cubit.getData(),
    expect: () => [
      isA<IGotIt>().having((s) => s.lista.map((e) => e.id).toList(), 'ids', [1])
    ],
  );
}
