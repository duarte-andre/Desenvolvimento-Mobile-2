import 'package:flutter/material.dart';

void main() {
  runApp(Telaprincipal());
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Campotexto() ,
    );
  }
}

class Campotexto extends StatefulWidget {
   Campotexto({super.key});

  @override
  State<Campotexto> createState() => CampotextoState();
}

class CampotextoState extends State<Campotexto> {
  // variavel do tipo TextEditing controler para armazenar  o que é digitado no campo 
TextEditingController ctexto = TextEditingController();
  @override
  Widget build(BuildContext context) {

      // Aqui você pode definir a construção do widget de acordo com o estado return TextField(
    
    return Scaffold(
      appBar: AppBar(
       title: Text("Aplicativo Caixa de texto"),
      ),
      body: Column(
       children: [
        // Campo texto
        TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(labelText: "Digite seu nome"),
        
        // On changed exibe no terminal tudo que for digitado
        //a string serve para criar uma função

       /* onChanged: (String texto){
         print(texto);
        },*/

        /*onSubmitted: (String texto){
          print(texto);
        },*/
        controller: ctexto,
        ),
        ElevatedButton(onPressed: (){
          print(ctexto);
        }, child:Text("verificar")),
        TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: "Digite um número"),
        ),
       ], 
      ),
    );
  }
}
