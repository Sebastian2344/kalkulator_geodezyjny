import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/data_source/obliczenia_wciecie_katowe.dart';

void main() {
  late ObliczeniaWcieceKatowe obliczeniaWcieceKatowe;
  setUp(() {
    obliczeniaWcieceKatowe = ObliczeniaWcieceKatowe();
  });
  group('obliczenia wciecie kątowe', () {
    test('oblicz x', () async {
      final result = obliczeniaWcieceKatowe.answearX(723.14, 971.01, 286.54, 625.68, 44.8560, 37.4170);
      expect(result, 660.31);
    });

    test('oblicz y', () async {
      final result = obliczeniaWcieceKatowe.answearY(723.14, 971.01, 286.54, 625.68, 44.8560, 37.4170);
      expect(result, 656.19);
    });

    test('oblicz kontrolny kąt', () async {
      final result = obliczeniaWcieceKatowe.controlAngle(723.14, 971.01, 286.54, 625.68, 660.31, 656.19);
      expect(result, 117.7256);
    });

    test('oblicz kąt', () async {
      final result = obliczeniaWcieceKatowe.angle(44.8560, 37.4170);
      expect(result, 117.7270);
    });

    test('konwersja na double', () async {
      final result = obliczeniaWcieceKatowe.parseToDouble('100.5');
      expect(result, 100.5);
    });

  });
}
