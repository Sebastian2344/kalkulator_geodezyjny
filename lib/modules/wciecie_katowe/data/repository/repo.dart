import 'package:injectable/injectable.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/data_source/obliczenia_wciecie_katowe.dart';

import '../model/wciece_katowe_model.dart';

@lazySingleton
class WciecieRepository {
  final ObliczeniaWcieceKatowe obliczeniaWcieceKatowe;

  WciecieRepository(this.obliczeniaWcieceKatowe);

  WciecieKatoweModel oblicz(String xAS, String yAS, String xBS, String yBS,
      String alfaAngleS, String betaAngleS) {
    try {
      final xA = obliczeniaWcieceKatowe.parseToDouble(xAS);
      final xB = obliczeniaWcieceKatowe.parseToDouble(xBS);
      final yA = obliczeniaWcieceKatowe.parseToDouble(yAS);
      final yB = obliczeniaWcieceKatowe.parseToDouble(yBS);
      final alfaAngle = obliczeniaWcieceKatowe.parseToDouble(alfaAngleS);
      final betaAngle = obliczeniaWcieceKatowe.parseToDouble(betaAngleS);
      final answearX =
          obliczeniaWcieceKatowe.answearX(xA, yA, xB, yB, alfaAngle, betaAngle);
      final answearY =
          obliczeniaWcieceKatowe.answearY(xA, yA, xB, yB, alfaAngle, betaAngle);
      final angle = obliczeniaWcieceKatowe.angle(alfaAngle, betaAngle);
      final controlAngle = obliczeniaWcieceKatowe.controlAngle(
          xA, yA, xB, yB, answearX, answearY);
      return WciecieKatoweModel(xA, xB, yA, yB, alfaAngle, betaAngle, answearX,
          answearY, angle, controlAngle);
    } catch (e) {rethrow;}
  }
}
