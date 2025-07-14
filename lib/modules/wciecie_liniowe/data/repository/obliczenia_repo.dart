import 'package:injectable/injectable.dart';
import '../data_source/obliczenia_liniowe.dart';
import '../model/wciecie_liniowe_model.dart';

@lazySingleton
class WciecieLinioweRepository {
  final ObliczeniaLiniowe obliczeniaWcieceKatowe;

  WciecieLinioweRepository(this.obliczeniaWcieceKatowe);

  WciecieLinioweModel oblicz(String xAS, String yAS, String xBS, String yBS,
      String apS, String bpS, String abS) {
    try {
      final xA = obliczeniaWcieceKatowe.parseToDouble(xAS);
      final xB = obliczeniaWcieceKatowe.parseToDouble(xBS);
      final yA = obliczeniaWcieceKatowe.parseToDouble(yAS);
      final yB = obliczeniaWcieceKatowe.parseToDouble(yBS);
      final ap = obliczeniaWcieceKatowe.parseToDouble(apS);
      final bp = obliczeniaWcieceKatowe.parseToDouble(bpS);
      final ab = obliczeniaWcieceKatowe.parseToDouble(abS);
      final kwadratA = obliczeniaWcieceKatowe.kwadratyBokow(bp);
      final kwadratB = obliczeniaWcieceKatowe.kwadratyBokow(ap);
      final kwadratC = obliczeniaWcieceKatowe.kwadratyBokow(ab);
      final karnotianA =
          obliczeniaWcieceKatowe.karnotiany(kwadratA, kwadratB, kwadratC, 'A');
      final karnotianB =
          obliczeniaWcieceKatowe.karnotiany(kwadratA, kwadratB, kwadratC, 'B');
      final karnotianC =
          obliczeniaWcieceKatowe.karnotiany(kwadratA, kwadratB, kwadratC, 'C');
      final px4 =
          obliczeniaWcieceKatowe.px4(karnotianA, karnotianB, karnotianC);
      final a = obliczeniaWcieceKatowe.abc(
          px4, xA, yA, xB, yB, karnotianA, karnotianB, karnotianC, 'A');
      final b = obliczeniaWcieceKatowe.abc(
          px4, xA, yA, xB, yB, karnotianA, karnotianB, karnotianC, 'B');
      final c = obliczeniaWcieceKatowe.abc(
          px4, xA, yA, xB, yB, karnotianA, karnotianB, karnotianC, 'C');
      final xP = obliczeniaWcieceKatowe.wynikX(a, c);
      final yP = obliczeniaWcieceKatowe.wynikY(b, c);
      return WciecieLinioweModel(xA, xB, yA, yB, xP, yP, px4, karnotianA,
          karnotianB, karnotianC, ap, bp, ab);
    } catch (e) {rethrow;}
  }
}