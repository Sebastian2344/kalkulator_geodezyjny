import 'package:equations/equations.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ObliczeniaBiegunowa{
  
  List<double> wynikbiegunowej({required double wsX,required double wsY,required double az,required double odl,required double azAb}){
    
    const parser = ExpressionParser();
    az = parser.evaluate('$az * 2 * pi / 400');
    double przyrostX = double.parse(parser.evaluate('cos($az + $azAb) * $odl').toStringAsFixed(3));
    double przyrostY = double.parse(parser.evaluate('sin($az + $azAb) * $odl').toStringAsFixed(3));
    double wynikX = double.parse(parser.evaluate('$wsX + $przyrostX').toStringAsFixed(3));
    double wynikY = double.parse(parser.evaluate('$wsY + $przyrostY').toStringAsFixed(3));
    azAb = double.parse(parser.evaluate('$azAb * 400 / (2 * pi)').toStringAsFixed(4));
    List<double> wyniki = [azAb,przyrostX,przyrostY, wynikX, wynikY];
    return wyniki;
  }

  double azymut({required double wsX,required double wsY,required double wnY,required double wnX}){
    const parser = ExpressionParser();
    double czAB = parser.evaluate('abs(atan(($wnY - $wsY) / ($wnX - $wsX)))');
    double azAb = 0;
    
    if(wnY - wsY > 0 && wnX - wsX > 0){
      azAb = czAB;
    }else if(wnY - wsY < 0 && wnX - wsX > 0){
      azAb = parser.evaluate('2 * pi - $czAB');
    }else if(wnY - wsY > 0 && wnX - wsX < 0){
      azAb = parser.evaluate(' pi - $czAB');
    }else if(wnY - wsY < 0 && wnX - wsX < 0){
      azAb = parser.evaluate(' pi + $czAB');
    }else if(wnY - wsY == 0 && wnX - wsX < 0){
      azAb = parser.evaluate('pi');
    }else if(wnY - wsY < 0 && wnX - wsX == 0){
      azAb = parser.evaluate('pi * 1.5');
    }else if(wnY - wsY == 0 && wnX - wsX > 0){
      azAb = parser.evaluate('0');
    }else if(wnY - wsY > 0 && wnX - wsX == 0){
      azAb = parser.evaluate('pi / 2');
    } 
    return azAb;
  }

   List<double> parsetodouble({required String wsX,required String wsY,required String wnX,required String wnY,required String az,required String odl}){
      double wsXd = double.parse(wsX);
      double wsYd = double.parse(wsY);
      double wnXd = double.parse(wnX);
      double wnYd = double.parse(wnY);
      double azd = double.parse(az);
      double odld = double.parse(odl);
      List<double> wyniki = [wsXd,wsYd,wnXd,wnYd,azd,odld];
    return wyniki;
  }
}