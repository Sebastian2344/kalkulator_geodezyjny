import 'package:equations/equations.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ObliczeniaOrtogonalna{

  double azymut({required double wsX,required double wsY,required double wnX,required double wnY}){
    
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
  
  
  List<List<double>> wynikOrtogonalnej({required double wsX,required double wsY,required double bierzaca,required double domiar,required double azymut}){
    
    const parser = ExpressionParser();
    List<List<double>> wynikiObliczen = [];
    double przyrostX = double.parse(parser.evaluate('$bierzaca * cos($azymut) - $domiar * sin($azymut)').toStringAsFixed(3));
    double przyrostY = double.parse(parser.evaluate('$bierzaca * sin($azymut) + $domiar * cos($azymut)').toStringAsFixed(3));
    double wynikX = double.parse(parser.evaluate('$wsX + $przyrostX').toStringAsFixed(3));
    double wynikY = double.parse(parser.evaluate('$wsY + $przyrostY').toStringAsFixed(3));
    azymut = double.parse(parser.evaluate('$azymut * 400 / (2 * pi)').toStringAsFixed(4));
    
    wynikiObliczen.add([wynikX,wynikY,azymut]);wynikiObliczen.add([przyrostX,przyrostY]);
    return wynikiObliczen;
  }

  List<double> parseToDouble(String wsX,String wsY,String wnX,String wnY,String az,String odl){
      
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