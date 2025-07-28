import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/cubit/biegunowa_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/data_source/obliczenia_biegunowa.dart';

// Mocktail mock
class MockObliczeniaBiegunowa extends Mock implements ObliczeniaBiegunowa {}

void main() {
  late MockObliczeniaBiegunowa mockObliczenia;

  setUp(() {
    mockObliczenia = MockObliczeniaBiegunowa();
    // Rejestracja fallbacków dla parametrów named
    registerFallbackValue('');
  });

  blocTest<BiegunowaCubit, BiegunowaState>(
    'emits BiegunowaSuccesful when dane są poprawne',
    build: () {
      when(() => mockObliczenia.parsetodouble(
        wsX: any(named: 'wsX'),
        wsY: any(named: 'wsY'),
        wnX: any(named: 'wnX'),
        wnY: any(named: 'wnY'),
        az: any(named: 'az'),
        odl: any(named: 'odl'),
      )).thenReturn([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      when(() => mockObliczenia.azymut(
        wsX: 1.0, wsY: 2.0, wnX: 3.0, wnY: 4.0,
      )).thenReturn(7.0);
      when(() => mockObliczenia.wynikbiegunowej(
        wsX: 1.0, wsY: 2.0, az: 5.0, odl: 6.0, azAb: 7.0,
      )).thenReturn([8.0, 9.0, 10.0, 11.0, 12.0]);

      return BiegunowaCubit(obliczenia: mockObliczenia);
    },
    act: (cubit) => cubit.wynikbiegunowej('1', '2', '3', '4', '5', '6'),
    expect: () => [
      isA<BiegunowaSuccesful>()
          .having((s) => s.wynik, 'wynik', [11.0, 12.0])
          .having((s) => s.przyrosty, 'przyrosty', [9.0, 10.0])
          .having((s) => s.dane, 'daneparse', [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
          .having((s) => s.azymut, 'azymut', 8.0),
    ],
  );

  blocTest<BiegunowaCubit, BiegunowaState>(
    'emits BiegunowaError when FormatException is thrown',
    build: () {
      when(() => mockObliczenia.parsetodouble(
        wsX: any(named: 'wsX'),
        wsY: any(named: 'wsY'),
        wnX: any(named: 'wnX'),
        wnY: any(named: 'wnY'),
        az: any(named: 'az'),
        odl: any(named: 'odl'),
      )).thenThrow(FormatException());
      return BiegunowaCubit(obliczenia: mockObliczenia);
    },
    act: (cubit) => cubit.wynikbiegunowej('a', 'b', 'c', 'd', 'e', 'f'),
    expect: () => [
      isA<BiegunowaError>(),
    ],
  );
}