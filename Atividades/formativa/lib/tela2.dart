import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaView extends StatefulWidget {
  const TelaView({Key? key}) : super(key: key);

  @override
  _TelaViewState createState() => _TelaViewState();
}

class _TelaViewState extends State<TelaView> {
  @override
  void initState(){
    super.initState();
    _getDados();    
  }
  String url = "http://10.109.83.21:3000/produtos";
  List<Produto> produtos = [];
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  // Método para atualizar os dados da lista de produtos


  // Método para obter os dados da API
  _getDados() async {
    try {
      http.Response resposta = await http.get(Uri.parse(url));
      if (resposta.statusCode == 200) {
        var dados = jsonDecode(resposta.body) as List;
        setState(() {
          produtos = dados.map((json) => Produto.fromJson(json)).toList();
        });
      } else {
        throw Exception('Erro ao obter os dados da API');
      }
    } catch (e) {
      print('Erro: $e');
      // Adicione aqui a lógica para exibir um feedback ao usuário, se eu quiser:)
    }
  }

  _alterar() async {
    try {
      Map<String, dynamic> produto = {
        "id": "8",
        "nome": nomeController.text,
        "valor": valorController.text,
      };

      http.Response resposta = await http.put(
        Uri.parse('$url/8'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(produto),
      );

      if (resposta.statusCode == 200) {
        // Adicione aqui a lógica para exibir um feedback ao usuário, por exemplo, um SnackBar
        print('Produto alterado com sucesso');
      } else {
        throw Exception('Erro ao alterar o produto');
      }
    } catch (e) {
      print('Erro: $e');
      // Adicione aqui a lógica para exibir um feedback ao usuário, por exemplo, um SnackBar
    }
  }

  _deletar(String id) async {
    try {
      http.Response resposta = await http.delete(Uri.parse('$url/$id'));
      if (resposta.statusCode == 200) {
        // Adicione aqui a lógica para exibir um feedback ao usuário, por exemplo, um SnackBar
        print('Produto deletado com sucesso');
      } else {
        throw Exception('Erro ao deletar o produto');
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
        title: Text("Visualizar os Produtos"),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              " Consumo de API ",
              style: TextStyle(fontSize: 18),
            ),
            Column(
  children: produtos.map((produto) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Image.network(
              produto.imagem_url,
              width: double.infinity,
              height: 250, // Altura da imagem
              fit: BoxFit.cover, // Ajuste a imagem para cobrir toda a área do widget
            ),
            SizedBox(height: 10),
            Text(
              "${produto.nome}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Valor: ${produto.valor}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para alterar o produto
                    // Implemente a lógica de alteração aqui
                  },
                  child: Text("Alterar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para deletar o produto
                    _deletar(produto.id);
                  },
                  child: Text("Deletar"),
                ), 
              ],
            ),
          ],
        ),
      ),
    );
  }).toList(),
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
  final String imagem_url;

  Produto(this.id, this.nome, this.valor, this.imagem_url);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(json['id'], json['nome'], json['valor'], json['imagem_url']);
  }
}
