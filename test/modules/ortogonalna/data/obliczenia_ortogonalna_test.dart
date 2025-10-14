import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/data/data_source/obliczenia_ortogonalna.dart';

void main(){
  late ObliczeniaOrtogonalna obliczeniaOrtogonalna;
  setUp((){
    obliczeniaOrtogonalna = ObliczeniaOrtogonalna();
  });
  
  test('Policz azymut', (){
    double azymut = obliczeniaOrtogonalna.azymut(wsX: 0, wsY: 0, wnX: 1, wnY: 1);
    expect(azymut, 0.7853981633974483);
  });

  test('Policz wynik ortogonalnej', (){
    List<List<double>> wynik = obliczeniaOrtogonalna.wynikOrtogonalnej(wsX: 0, wsY: 0, bierzaca: 100, domiar: 0, azymut: 0);
    expect(wynik[0][0], 100);
    expect(wynik[0][1], 0);
    expect(wynik[0][2], 0);
    expect(wynik[1][0], 100);
    expect(wynik[1][1], 0);
  });

  test('Parsowanie do double', (){
    List<double> wynik = obliczeniaOrtogonalna.parseToDouble('0','0','1','1','100','100');
    expect(wynik[0], 0);
    expect(wynik[1], 0);
    expect(wynik[2], 1);
    expect(wynik[3], 1);
    expect(wynik[4], 100);
    expect(wynik[5], 100);
  });
}