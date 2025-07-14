import 'package:flutter/material.dart';

class InitialStateOrtogonalnaView extends StatelessWidget {
  const InitialStateOrtogonalnaView({super.key,required this.width});
  final double width;
  final TextStyle style = const TextStyle(
    fontSize: 16,
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
            text('Azymut:'),
            text('g'),
            SizedBox(width: width * 0.35,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text('Przyrosty:'),
            text('X'),
            text('Y')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text('Wynik:'),
            text('X'),
            text('Y')
          ],
        ),
      ],
    );
  }

   Widget text(String j) {
    return j.length > 1?Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.brown[800],border: Border.all(width: 2)),
      width: width * 0.22,
      child: Text(
        j,
        style: style,
      ),
    ):Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(color: Colors.brown[800],border: Border.all(width: 2)),
          width: width * 0.35,
          child: Text(
            j,
            style: style,
          ),
        );
  }
}