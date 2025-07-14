import 'package:flutter/material.dart';

import '../nav/go_router.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key,required this.nextPage, required this.buttonText});
  final String nextPage;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigation.router.pushReplacement(nextPage);
      },
      style: FilledButton.styleFrom(
        fixedSize: const Size(300, 100),
        backgroundColor: const Color.fromARGB(255, 1, 24, 2),
        textStyle: const TextStyle(fontSize: 22),
        side: const BorderSide(width: 2),
      ),
      child: Text(buttonText),
    );
  }
}