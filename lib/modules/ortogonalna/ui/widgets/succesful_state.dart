import 'package:flutter/material.dart';

class SuccesfulStateOrtogonalnaView extends StatelessWidget {
  const SuccesfulStateOrtogonalnaView({
    super.key,
    required this.wynik,
    required this.przyrosty,
    required this.width,
  });
  final List<double> wynik;
  final List<double> przyrosty;
  final double width;
  final TextStyle style = const TextStyle(
    fontSize: 15,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text(null,'Azymut:'),
            text(wynik[2], 'g'),
            SizedBox(width: width * 0.35,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text(null,'Przyrosty:'),
            text(przyrosty[0], 'X'),
            text(przyrosty[1], 'Y')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text(null,'Wynik:'),
            text(wynik[0], 'X'),
            text(wynik[1], 'Y')
          ],
        ),
      ],
    );
  }

    Widget text(double? value,String j) {
    return value != null?Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.brown[900],border: Border.all(width: 2)),
      width: width * 0.35,
      child: Text(
        '$value $j',
        style: style,
      )):
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.brown[800],border: Border.all(width: 2)),
        width: width * 0.22,
        child: Text(
          j,
          style: style,
        ),
      );
  }
}