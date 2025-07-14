import 'package:flutter/material.dart';

class BeautyTextField extends StatelessWidget {
  const BeautyTextField({super.key,required this.controller,required this.label});
  final String label;
  final TextEditingController controller;
    @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(padding:const EdgeInsets.only(bottom: 8),
          height: MediaQuery.of(context).size.height / 12,
          alignment: Alignment.bottomCenter,
          child: Text(label,textAlign: TextAlign.center,style:const TextStyle(color: Colors.white,fontSize: 16,),)),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.brown[900], // Kolor tła
              borderRadius: BorderRadius.circular(10.0), // Zaokrąglenie rogów
              border: Border.all(
                color: Colors.black, // Kolor granicy
                width: 2.0,
              ),
            ),
            child: TextField(
              cursorColor: Colors.black,
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Podaj dane', 
                hintStyle: TextStyle(color: Color.fromARGB(130, 255, 255, 255),),// Podpowiedź tekstowa
                border: InputBorder.none, // Usunięcie domyślnej granicy
              ),
              style: const TextStyle(
                color: Colors.white,fontSize: 16 // Kolor tekstu
              ),
            ),
          ),
        ],
      ),
    );
  }
}