import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/data/data_source/obliczenia_ortogonalna.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockObliczeniaOrtogonalna extends Mock implements ObliczeniaOrtogonalna {}

void main() {
  late MockObliczeniaOrtogonalna mockObliczenia;
  late OrtogonalnaCubit cubit;

  setUp(() {
    mockObliczenia = MockObliczeniaOrtogonalna();
    cubit = OrtogonalnaCubit(obliczenia: mockObliczenia);
  });

  group('OrtogonalnaCubit', () {
    test('początkowy stan to OrtogonalnaInitial', () {
      expect(cubit.state, OrtogonalnaInitial());
    });

    blocTest<OrtogonalnaCubit, OrtogonalnaState>(
      'emituje OrtogonalnaSuccesful przy poprawnych danych',
      setUp: () {
        when(() => mockObliczenia.parseToDouble(any(), any(), any(), any(), any(), any()))
            .thenReturn([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
        when(() => mockObliczenia.azymut(wsX: any(named: 'wsX'), wsY: any(named: 'wsY'), wnX: any(named: 'wnX'), wnY: any(named: 'wnY')))
            .thenReturn(1.23);
        when(() => mockObliczenia.wynikOrtogonalnej(
          wsX: any(named: 'wsX'),
          wsY: any(named: 'wsY'),
          bierzaca: any(named: 'bierzaca'),
          domiar: any(named: 'domiar'),
          azymut: any(named: 'azymut'),
        )).thenReturn([
          [7.0, 8.0, 9.0],
          [10.0, 11.0, 12.0]
        ]);
      },
      build: () => cubit,
      act: (cubit) => cubit.wynikOrtogonalnej('1', '2', '3', '4', '5', '6'),
      expect: () => [
        isA<OrtogonalnaSuccesful>()
      ],
    );

    blocTest<OrtogonalnaCubit, OrtogonalnaState>(
      'emituje OrtogonalnaError przy FormatException',
      setUp: () {
        when(() => mockObliczenia.parseToDouble(any(), any(), any(), any(), any(), any()))
            .thenThrow(FormatException());
      },
      build: () => cubit,
      act: (cubit) => cubit.wynikOrtogonalnej('a', 'b', 'c', 'd', 'e', 'f'),
      expect: () => [
        isA<OrtogonalnaError>(),
      ],
    );

    blocTest<OrtogonalnaCubit, OrtogonalnaState>(
      'resetState emituje OrtogonalnaInitial',
      build: () => cubit,
      act: (cubit) => cubit.resetState(),
      expect: () => [OrtogonalnaInitial()],
    );
  });
}