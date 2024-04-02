import 'package:flutter/material.dart';
import 'package:sm_mobile/frase3.dart';

class frase_2 extends StatefulWidget {
  const frase_2({super.key});

  @override
  State<frase_2> createState() => _frase_2State();
}

class _frase_2State extends State<frase_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(   "   Eu vos dou um novo mandamento: amai-vos uns aos outros"),
       
        ElevatedButton(onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => frase_3()));

        }, child: Text("Frase 3")),

        
      ],
     ),

      );
    
  }
}