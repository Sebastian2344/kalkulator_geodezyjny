import 'package:equations/equations.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ObliczeniaLiniowe {
  double kwadratyBokow(double odleglosc) {
    const parser = ExpressionParser();
    final kwadrat = double.parse(
        parser.evaluate('$odleglosc * $odleglosc').toStringAsFixed(2));
    return kwadrat;
  }

  double karnotiany(
      double kwadratA, double kwadratB, double kwadratC, String litera) {
    const parser = ExpressionParser();
    double karnotian = 0;
    switch (litera) {
      case "A":
        karnotian = parser.evaluate('-$kwadratA + $kwadratB + $kwadratC');
        break;
      case "B":
        karnotian = parser.evaluate('$kwadratA - $kwadratB + $kwadratC');
        break;
      case "C":
        karnotian = parser.evaluate('$kwadratA + $kwadratB - $kwadratC');
        break;
    }
    return karnotian;
  }

  double px4(double karnotianA, double karnotianB, double karnotianC) {
    const parser = ExpressionParser();
    return parser.evaluate(
        'sqrt($karnotianA*$karnotianB+$karnotianA*$karnotianC+$karnotianB*$karnotianC)');
  }

  double abc(double p, double xA, double yA, double xB, double yB,
      double karnotianA, double karnotianB, double karnotianC, String litera) {
    const parser = ExpressionParser();
    double liczba = 0;
    switch (litera) {
      case "A":
        liczba =
            parser.evaluate('$xA*$karnotianB+$yA*$p+$xB*$karnotianA-$yB*$p');
        break;
      case "B":
        liczba =
            parser.evaluate('-$xA*$p+$yA*$karnotianB+$xB*$p+$yB*$karnotianA');
        break;
      case "C":
        liczba = parser.evaluate('$karnotianA + $karnotianB');
        break;
    }
    return liczba;
  }

  double wynikX(double a, double c) {
    const parser = ExpressionParser();
    return double.parse(parser.evaluate('$a/$c').toStringAsFixed(2));
  }

  double wynikY(double b, double c) {
    const parser = ExpressionParser();
    return double.parse(parser.evaluate('$b/$c').toStringAsFixed(2));
  }

  double parseToDouble(String x) {
    double xParsed = double.parse(x);
    return xParsed;
  }
}
