import 'package:flutter/material.dart';
import 'package:sm_mobile/frase5.dart';

class frase_4 extends StatefulWidget {
  const frase_4({super.key});

  @override
  State<frase_4> createState() => _frase_4State();
}

class _frase_4State extends State<frase_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("frase 4"),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("“Penso, logo existo”"),
          
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
               MaterialPageRoute(builder: (context) => frase_5()));
          }, child: Text("Frase 5"))
        ]),
      ),
    );
  }
}