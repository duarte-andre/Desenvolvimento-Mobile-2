import 'package:sm_mobile/frase2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: frase_1(),
  ));
}

class frase_1 extends StatefulWidget {
  const frase_1({super.key});

  @override
  State<frase_1> createState() => frase_1State();
}

class frase_1State extends State<frase_1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("SM MOBILE"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("“Nada é permanente, exceto a mudança”", 
            ),
          
           
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  frase_2()));
                  // route,
                  // Widget que permite navegação entre telas
                },
                child: Text("frase 2")),
            ],
          ),
        ),
      );
    
  }
}