import 'package:flutter/material.dart';
import 'package:app_multi_telas/telaSecundaria.dart'; // Importa a tela secundária

void main() {
  runApp(MaterialApp(
    home: Telaprincipal(), // Define a tela principal como a tela inicial do aplicativo
  ));
}

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({Key? key}) : super(key: key);

  @override
  State<Telaprincipal> createState() => TelaprincipalState();
}

class TelaprincipalState extends State<Telaprincipal> {
  TextEditingController ctexto = TextEditingController(); // Controlador para o campo de texto do nome de usuário
  TextEditingController senhaController = TextEditingController(); // Controlador para o campo de texto da senha

  String usuario = 'usuario'; // Nome de usuário predefinido
  String senhaCorreta = 'senha'; // Senha predefinida

  void fazerLogin() {
    String usuarioDigitado = ctexto.text; // Obtém o texto digitado no campo de usuário
    String senhaDigitada = senhaController.text; // Obtém o texto digitado no campo de senha

    if (usuarioDigitado == usuario && senhaDigitada == senhaCorreta) {
      // Verifica se o nome de usuário e senha digitados correspondem aos valores predefinidos
      print('Login bem-sucedido!'); // Exibe mensagem de sucesso no console
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Telasecundaria()), // Navega para a tela secundária
      );
    } else {
      print('Login falhou. Tente novamente.'); // Exibe mensagem de falha no console
      // Aqui serve para adicionar uma mensagem de erro ao usuário.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App múltiplas telas"), // Título do app
      ),
      //aqui criamo o corpo do app
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Digite seu nome",
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(style: BorderStyle.none, color: Colors.grey),
                
              ),
              fillColor: const Color.fromARGB(255, 216, 205, 205), // Define a cor de preenchimento do campo de texto
              filled: true, // Define se o campo de texto deve ser preenchido ou não
              labelStyle: TextStyle(color: Colors.deepPurple,
              fontSize: 18),
              ), // Define o rótulo do campo de texto do nome de usuário
              controller: ctexto, // Associa o controlador ao campo de texto do nome de usuário
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true, // Define o campo de senha como obscureText para ocultar o texto digitado
              decoration: InputDecoration(labelText: "Digite sua senha",
              labelStyle: TextStyle(fontSize: 18)), // Define o rótulo do campo de texto da senha
              controller: senhaController, // Associa o controlador ao campo de texto da senha
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fazerLogin, // Define a função de callback quando o botão é pressionado
              child: Text("Entrar"), // Define o texto do botão de entrada
            ),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
