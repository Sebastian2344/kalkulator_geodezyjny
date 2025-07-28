import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/history_ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/data/data_source/save_ortogonalna_service.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/data/models/save_ortogonalna.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';


class MockSaveOrtogonalnaService extends Mock implements SaveOrtogonalnaService {}

void main() {
  late MockSaveOrtogonalnaService mockService;
  late HistoryOrtogonalnaCubit cubit;

  setUp(() {
    mockService = MockSaveOrtogonalnaService();
    cubit = HistoryOrtogonalnaCubit(mockService);
  });

  group('HistoryOrtogonalnaCubit', () {
    test('początkowy stan to HistoryOrtogonalnaInitial', () {
      expect(cubit.state, HistoryOrtogonalnaInitial());
    });

    blocTest<HistoryOrtogonalnaCubit, HistoryOrtogonalnaState>(
      'getFromDb emituje IGotIt z danymi',
      setUp: () {
        when(() => mockService.getData()).thenAnswer((_) async => [SaveOrtogonalna()]);
      },
      build: () => cubit,
      act: (cubit) => cubit.getFromDb(),
      expect: () => [isA<IGotIt>()],
    );

    blocTest<HistoryOrtogonalnaCubit, HistoryOrtogonalnaState>(
      'resetState emituje HistoryOrtogonalnaInitial',
      build: () => cubit,
      act: (cubit) => cubit.resetState(),
      expect: () => [HistoryOrtogonalnaInitial()],
    );

    test('saveToDb wywołuje saveData w serwisie', () async {
      when(() => mockService.saveData(any())).thenAnswer((_) async {});
      await cubit.saveToDb('test', [1.0], 2.0, [3.0], [4.0]);
      verify(() => mockService.saveData(any())).called(1);
    });

    test('deleteFromDB wywołuje deleteData w serwisie', () async {
      when(() => mockService.deleteData(any())).thenAnswer((_) async {});
      await cubit.deleteFromDB(1);
      verify(() => mockService.deleteData(1)).called(1);
    });

    test('closeDB wywołuje closeDB w serwisie', () async {
      when(() => mockService.closeDB()).thenAnswer((_) async {return true;});
      await cubit.closeDB();
      verify(() => mockService.closeDB()).called(1);
    });

    blocTest<HistoryOrtogonalnaCubit, HistoryOrtogonalnaState>(
      'openDB wywołuje openDB i emituje HistoryOrtogonalnaInitial',
      setUp: () {
        when(() => mockService.openDB()).thenAnswer((_) async {});
      },
      build: () => cubit,
      act: (cubit) => cubit.openDB(),
      expect: () => [HistoryOrtogonalnaInitial()],
      verify: (_) => verify(() => mockService.openDB()).called(1),
    );
  });
}