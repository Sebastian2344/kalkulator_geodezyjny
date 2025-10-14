import 'package:equations/equations.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ObliczeniaWcieceKatowe{
  double answearX (double xA,double yA,double xB,double yB,double alfaAngle,double betaAngle){
    const parser = ExpressionParser();
    double A = parser.evaluate('$xA * (1 / tan($betaAngle * pi / 200)) + $yA + $xB * (1 / tan($alfaAngle * pi / 200)) - $yB');
    double C = parser.evaluate('(1 / tan($betaAngle * pi / 200)) + (1 / tan($alfaAngle * pi / 200))');
    double xp = parser.evaluate('$A / $C');
    return double.parse(xp.toStringAsFixed(2));
  }

  double answearY (double xA,double yA,double xB,double yB,double alfaAngle,double betaAngle){
    const parser = ExpressionParser();
    double B = parser.evaluate('- $xA + (1 / tan($betaAngle * pi / 200)) * $yA + $xB + (1 / tan($alfaAngle * pi / 200)) * $yB');
    double C = parser.evaluate('(1 / tan($betaAngle * pi / 200)) + (1 / tan($alfaAngle * pi / 200))');
    double yp = parser.evaluate('$B / $C');
    return double.parse(yp.toStringAsFixed(2));
  }

  double controlAngle(double xA,double yA,double xB,double yB,double xp,double yp){
    const parser = ExpressionParser();
    double temp = parser.evaluate('($xA - $xp) * ($yB - $yp) - ($yA - $yp) * ($xB - $xp)');
    double mianownik = parser.evaluate('($xA - $xp) * ($xB - $xp) + ($yA - $yp) * ($yB - $yp)');
    double atan = parser.evaluate('1 / tan($temp / $mianownik )');
    double kontrola = parser.evaluate(' $atan * 200 / pi');
    return double.parse(kontrola.toStringAsFixed(4));
  }

  double angle(double alfaAngle,double betaAngle){
    const parser = ExpressionParser();
    double angleGamma = parser.evaluate('200 -($alfaAngle + $betaAngle)');
   return angleGamma;
  }

   double parseToDouble(String x){
      double xParsed = double.parse(x);
    return xParsed;
  }
}