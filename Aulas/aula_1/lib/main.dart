import 'package:flutter/material.dart';

//void main função principal
void main() {
  runApp(MaterialApp(
    home:
    //pode ser usar tambem o ctrl + . selecionar o scaffold
    Scaffold(
      appBar:AppBar(
        title: Text("App - Aula 01 - Mobile 2"),
      ), 
      body:     
      //ctrl + . e escolhe wrap with center para deixar os containers no centro 
      Center(
        child: Column(
        //serve para fazer o alinhamento de containers por exemplo;
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //relação de herança, mais de uma informaçãoem uma mesma linha;
        
        children: [
          Container(
            color: Colors.blue,
            width: 200,
            height: 100,
            //adcionar texto, como aumentar a font e alinhar esse texto usando  TextAlign
            child: Text("Mobile 2", style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            
           ),
           Container(
            color: Colors.red,
            width: 200,
            height: 100,
            
           ),

            //adicionar botão e mandar mensagem no terminal
            ElevatedButton(onPressed: (){
              print("Botão pressionado");
            }, child: Text("Mensagem")),

        ],
          ),
      ),),

  ));
}

