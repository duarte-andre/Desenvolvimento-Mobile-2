import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key});

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  String url = "http://10.109.83.15:3000/produtos";
  List<Produto> produtos = []; 

  TextEditingController nomeController = TextEditingController(); // Controlador para o campo de texto do nome do produto
  TextEditingController valorController = TextEditingController(); // Controlador para o campo de texto do valor do produto

  _getDados() async {
    http.Response resposta = await http.get(Uri.parse(url)); // Faz uma requisição GET para obter os dados dos produtos da API
    var dados = jsonDecode(resposta.body) as List; // Converte a resposta da requisição para uma lista de produtos
    
    setState(() {
      produtos = dados.map((json) => Produto.fromJson(json)).toList(); // Atualiza a lista de produtos com os dados obtidos da API
    });
  }

  _enviar() {
    String nome = nomeController.text; // Obtém o valor do campo de texto do nome do produto
    String valor = valorController.text; // Obtém o valor do campo de texto do valor do produto

    if (nome.isNotEmpty && valor.isNotEmpty) { // Verifica se ambos os campos foram preenchidos
      Map<String, dynamic> produto = { // Cria um mapa com os dados do novo produto
        "nome": nome,
        "valor": valor,
      };

      http.post(
        Uri.parse(url), // Faz uma requisição POST para enviar os dados do novo produto para a API
        headers: <String,String>{
          'Content-type':'application/json; charset=UTF-8',
        },
        body: jsonEncode(produto), // Converte o mapa para JSON antes de enviar para a API
      );

      nomeController.clear(); // Limpa o campo de texto do nome após enviar o produto
      valorController.clear(); // Limpa o campo de texto do valor após enviar o produto
    }
  }

  _deletar() {
    http.delete(Uri.parse('$url/8')); // Faz uma requisição DELETE para deletar um produto da API (neste caso, o produto com ID 8)
  }

  _alterar() {
    Map<String, dynamic> produto = { // Cria um mapa com os novos dados do produto para alteração
      "id": "8",
      "nome": "Novo Nome",
      "valor": "Novo Valor",
    };

    http.put(
      Uri.parse('$url/8'), // Faz uma requisição PUT para modificar um produto da API (neste caso, o produto com ID 8)
      headers: <String,String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(produto), // Converte o mapa para JSON antes de enviar para a API
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "App post http"),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(" Consumo de API ",style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed: _getDados, child: Text("Ler")), // Botão para ler os dados da API
            SizedBox(height: 20),
            TextField(
              controller: nomeController, // Associa o controlador ao campo de texto do nome do produto
              decoration: InputDecoration(
                labelText: "Nome do Produto",
              ),
            ),
            TextField(
              controller: valorController, // Associa o controlador ao campo de texto do valor do produto
              decoration: InputDecoration(
                labelText: "Valor do Produto",
              ),
            ),
            ElevatedButton(onPressed: _enviar, child: Text("Enviar")), // Botão para enviar um novo produto para a API
            ElevatedButton(onPressed: _deletar, child: Text("Deletar")), // Botão para deletar um produto da API
            ElevatedButton(onPressed: _alterar, child: Text("Alterar")), // Botão para alterar um produto da API
            Column(
              children: produtos.map((produto) => Text("${produto.nome} - ${produto.valor}", style: TextStyle(fontSize: 18))).toList(), // Lista os produtos na interface
            ),
          ],
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
    return Produto(
      json['id'], json['nome'], json['valor']
    );
  }
}
