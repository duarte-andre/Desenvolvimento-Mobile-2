import 'package:flutter/material.dart';
import 'package:formativa/login.dart';
import 'package:formativa/tela2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key});

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final String url = "http://10.109.83.21:3000/produtos"; // URL da API

  TextEditingController nomeController = TextEditingController(); // Controlador para o campo de texto do nome do produto
  TextEditingController valorController = TextEditingController(); // Controlador para o campo de texto do valor do produto

  _enviar() async {
    try {
      String nome = nomeController.text; // Obtém o valor do campo de texto do nome do produto
      String valor = valorController.text; // Obtém o valor do campo de texto do valor do produto

      if (nome.isNotEmpty && valor.isNotEmpty) { // Verifica se ambos os campos foram preenchidos
        Map<String, dynamic> produto = { // Cria um mapa com os dados do novo produto
          "nome": nome,
          "valor": valor,
        };

        final response = await http.post( // Faz uma requisição POST para enviar os dados do novo produto para a API
          Uri.parse(url),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(produto),
        );

        if (response.statusCode == 200) { // Verifica se a requisição foi bem-sucedida
          // Feedback ao usuário
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Produto enviado com sucesso'),
            ),
          );
          // Limpa os campos após o envio
          nomeController.clear();
          valorController.clear();
        } else {
          throw Exception('Erro ao enviar o produto'); // Lança uma exceção em caso de erro na requisição
        }
      }
    } catch (e) {
      print('Erro: $e');
      // Adicione aqui a lógica para exibir um feedback ao usuário, por exemplo, um SnackBar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App post http"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Consumo de API ",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "Nome do Produto",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: valorController,
                decoration: InputDecoration(
                  labelText: "Valor do Produto",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviar,
                child: Text("Enviar"),
              ),
              SizedBox(height: 20),
             
              SizedBox(height: 20),
              ElevatedButton( // Botão que leva para a tela2.dart
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaView()),
                  );
                },
                child: Text("Ir para Tela 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Produto {
  final String id;
  final String nome;
  final String valor;

  Produto(this.id, this.nome, this.valor);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(json['id'], json['nome'], json['valor']);
  }
}