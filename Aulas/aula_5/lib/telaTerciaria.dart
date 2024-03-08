import 'package:app_multi_telas/main.dart';
import 'package:flutter/material.dart';

class Telaterciaria extends StatefulWidget {
  const Telaterciaria({super.key});

  @override
  State<Telaterciaria> createState() => _TelaterciariaState();
}

class _TelaterciariaState extends State<Telaterciaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 3"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            width: 200,
            height: 200,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => Telaprincipal()));

          }, child: Icon(Icons.ac_unit)),
        ],
        ),
    );
  }
}