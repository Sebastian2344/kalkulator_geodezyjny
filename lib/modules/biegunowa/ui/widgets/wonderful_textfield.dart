import 'package:flutter/material.dart';

class WonderfulTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const WonderfulTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(
            padding:const EdgeInsets.only(bottom: 8),
            height: MediaQuery.of(context).size.height / 12,
            alignment: Alignment.bottomCenter,
            child: Text(label,textAlign: TextAlign.center,style:const TextStyle(color: Colors.white,fontSize: 16),)),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green[900], 
              borderRadius: BorderRadius.circular(10.0), 
              border: Border.all(
                color: Colors.black,
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
                hintStyle: TextStyle(color:Color.fromARGB(129, 255, 255, 255),),
                border: InputBorder.none, 
              ),
              style: const TextStyle(
                color: Colors.white,fontSize: 16 
              ),
            ),
          ),
        ],
      ),
    );
  }
}