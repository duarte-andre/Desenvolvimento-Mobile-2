import 'package:formativa/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();

  TextEditingController senha = TextEditingController();

  int? op;

  _verificarlogin(){
    if(user.text == "admin" && senha.text =="1234" && op==1){
      print("Login administrador");
      Navigator.push(context, MaterialPageRoute(builder:(context)=> TelaPrincipal()));
    }
    else if(user.text == "admin" && senha.text =="1234" && op==2){
      print("Login cliente");
      Navigator.push(context, MaterialPageRoute(builder:(context)=> TelaPrincipal()));
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[600],
        title: Text("André LTDA"),
        
      ),
      body: Center(
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
      
                 TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 50),
                ),          
                icon: Icon(Icons.person_sharp),
                labelText: "Digite o usuário", 
                
                labelStyle: TextStyle(backgroundColor: Colors.white),),
                
                controller: user,
                
                 
              ),
               TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(width: 50),
              ),
              labelText: "Digite sua senha", icon: Icon(Icons.key),),
              controller: senha,
              obscureText: true,
              obscuringCharacter: "*",
               
            ),
      
                ],
              ),
              
              
             
            ),

           
            
           ElevatedButton(
            onPressed: () {
              _verificarlogin();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPrincipal()),
                );

           }, 
           child: Text("Entrar", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
  