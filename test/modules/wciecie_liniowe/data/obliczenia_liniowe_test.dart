import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/data_source/obliczenia_liniowe.dart';

void main(){
  late ObliczeniaLiniowe obliczeniaLiniowe;
  setUp((){
    obliczeniaLiniowe = ObliczeniaLiniowe();
  });

  test('kwadraty boków',() async {
    final wynik = obliczeniaLiniowe.kwadratyBokow(41.89);
    expect(wynik, 1754.77);
  });

  test('4p',() async {
    final wynik = obliczeniaLiniowe.px4(4519.23,3608.89,-99.35);
    expect(wynik.toStringAsFixed(6), '3937.242085');
  });

  test('karnotiany liczy A',() async {
    final wynik = obliczeniaLiniowe.karnotiany(1754.77,2209.94,4064.06,'A');
    expect(wynik, 4519.23);
  });

  test('karnotiany liczy B',() async {
    final wynik = obliczeniaLiniowe.karnotiany(1754.77,2209.94,4064.06,'B');
    expect(wynik, 3608.89);
  });

  test('karnotiany liczy C',() async {
    final wynik = obliczeniaLiniowe.karnotiany(1754.77,2209.94,4064.06,'C');
    expect(wynik.toStringAsFixed(2), '-99.35');
  });

  test('A',() async {
    final wynik = obliczeniaLiniowe.abc(3937.242085,5888980.61,8446671.50,5888922.34,8446645.63, 4519.23,3608.89,-99.35,'A');
    expect(wynik.round(), 47866179597);
  });

  test('B',() async {
    final wynik = obliczeniaLiniowe.abc(3937.242085,5888980.61,8446671.50,5888922.34,8446645.63, 4519.23,3608.89,-99.35,'B');
    expect(wynik.round(), 68655213217);
  });

  test('C',() async {
    final wynik = obliczeniaLiniowe.abc(3937.242085,5888980.61,8446671.50,5888922.34,8446645.63, 4519.23,3608.89,-99.35,'C');
    expect(wynik.toStringAsFixed(2), '8128.12');
  });

   test('wynik x',() async {
    final wynik = obliczeniaLiniowe.wynikX(47866179600,8128.12);
    expect(wynik, 5888960.74);
  });

   test('wynik y',() async {
    final wynik = obliczeniaLiniowe.wynikY(68655213220, 8128.12);
    expect(wynik, 8446628.89);
  });
}