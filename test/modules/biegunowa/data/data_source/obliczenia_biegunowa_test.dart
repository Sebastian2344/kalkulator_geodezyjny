import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/data_source/obliczenia_biegunowa.dart';


void main() {
  late ObliczeniaBiegunowa obliczenia;

  setUp(() {
    obliczenia = ObliczeniaBiegunowa();
  });

  group('ObliczeniaBiegunowa', () {
    test('parsetodouble parses strings to doubles', () {
      final result = obliczenia.parsetodouble(
        wsX: '100.5',
        wsY: '200.5',
        wnX: '300.5',
        wnY: '400.5',
        az: '50.5',
        odl: '60.5',
      );
      expect(result, [100.5, 200.5, 300.5, 400.5, 50.5, 60.5]);
    });

    test('azymut returns correct value for NE quadrant', () {
      final az = obliczenia.azymut(wsX: 0, wsY: 0, wnX: 1, wnY: 1);
      expect(az, closeTo(0.785398, 0.0001)); // pi/4
    });

    test('wynikbiegunowej returns correct list length', () {
      final result = obliczenia.wynikbiegunowej(
        wsX: 100,
        wsY: 200,
        az: 50,
        odl: 60,
        azAb: 0.1,
      );
      expect(result.length, 5);
    });
  });
}