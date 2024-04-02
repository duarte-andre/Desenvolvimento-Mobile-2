import 'package:flutter/material.dart';
import 'package:sm_mobile/main.dart';

class frase_5 extends StatefulWidget {
  const frase_5({super.key});

  @override
  State<frase_5> createState() => _frase_5State();
}

class _frase_5State extends State<frase_5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frase 5"),
      ),
    body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
          Text("mamo logo existo!"),

          ElevatedButton(onPressed: (){
            Navigator.push(context,
              
            MaterialPageRoute(builder: (context) => frase_1()));
          }, child: Text("Frase 1"))
          ],
        
      ),
    ),
    );
  }
}