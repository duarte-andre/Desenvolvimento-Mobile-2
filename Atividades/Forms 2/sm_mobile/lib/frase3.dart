import 'package:flutter/material.dart';
import 'package:sm_mobile/frase4.dart';

class frase_3 extends StatefulWidget {
  const frase_3({super.key});

  @override
  State<frase_3> createState() => _frase_3State();
}

class _frase_3State extends State<frase_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frase 2"),
      ),
      body: Center (
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ser ou não ser, eis a questão"),
          

          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
               MaterialPageRoute(builder: (context)=> frase_4()));
          }, child: Text("Frase 4")),
          
          
        ]),
      ),
    );
  }
}