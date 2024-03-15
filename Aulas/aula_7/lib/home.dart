import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String preco = "0";
  String? origemCurrency;
  String? destinoCurrency;
  TextEditingController valorController = TextEditingController();

  _consultaPreco() async {
    String url = "https://blockchain.info/ticker"; // URL da API
    http.Response response = await http.get(Uri.parse(url)); // Espera o retorno da API
    Map<String, dynamic> dados = response.body.isNotEmpty ? Map<String, dynamic>.from(json.decode(response.body)) : {}; // Decodifica o dado da API

    // Atualiza o valor do preço com base na moeda de origem selecionada
    setState(() {
      preco = dados[origemCurrency ?? "BRL"]["buy"].toString();
    });

    print("Resultado da API: ${response.statusCode.toString()}");
    print("Valores da Moeda: ${dados}");
    print("Valor do Bitcoin em ${origemCurrency}: $preco");
  }

  _calcularConversao() {
    if (origemCurrency == null || destinoCurrency == null) {
      // Verifica se as moedas de origem e destino foram selecionadas
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
            content: Text("Por favor, selecione a moeda de origem e a moeda de destino."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    double valor = double.tryParse(valorController.text) ?? 0; // Valor digitado pelo usuário
    double resultado;

    // Realiza o cálculo da conversão com base nas taxas fornecidas
    switch (origemCurrency) {
      case "BRL":
        switch (destinoCurrency) {
          case "USD":
            resultado = valor * 0.18; // Conversão de Real para Dólar
            break;
          case "EUR":
            resultado = valor * 0.15; // Conversão de Real para Euro
            break;
          default:
            resultado = valor; // Não há conversão necessária
        }
        break;
      case "USD":
        switch (destinoCurrency) {
          case "BRL":
            resultado = valor * 5.50; // Conversão de Dólar para Real
            break;
          case "EUR":
            resultado = valor * 0.88; // Conversão de Dólar para Euro
            break;
          default:
            resultado = valor; // Não há conversão necessária
        }
        break;
      case "EUR":
        switch (destinoCurrency) {
          case "BRL":
            resultado = valor * 7.00; // Conversão de Euro para Real
            break;
          case "USD":
            resultado = valor * 1.13; // Conversão de Euro para Dólar
            break;
          default:
            resultado = valor; // Não há conversão necessária
        }
        break;
      default:
        resultado = valor; // Não há conversão necessária
    }

    // Exibe o resultado da conversão em um diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultado da Conversão"),
          content: Text("$valor ${origemCurrency} = ${resultado.toStringAsFixed(2)} ${destinoCurrency}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Consulta Preço Bitcoin"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 150,
              color: Colors.amber,
              child: Image.asset("imagens/bitcoin.png"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor a ser convertido',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: "BRL",
                  groupValue: origemCurrency,
                  onChanged: (value) {
                    setState(() {
                      origemCurrency = value.toString();
                    });
                  },
                ),
                Text('Real', style: TextStyle(fontSize: 16)),
                Radio(
                  value: "USD",
                  groupValue: origemCurrency,
                  onChanged: (value) {
                    setState(() {
                      origemCurrency = value.toString();
                    });
                  },
                ),
                Text('Dólar', style: TextStyle(fontSize: 16)),
                Radio(
                  value: "EUR",
                  groupValue: origemCurrency,
                  onChanged: (value) {
                    setState(() {
                      origemCurrency = value.toString();
                    });
                  },
                ),
                Text('Euro', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: "BRL",
                  groupValue: destinoCurrency,
                  onChanged: (value) {
                    setState(() {
                      destinoCurrency = value.toString();
                    });
                  },
                ),
                Text('Real', style: TextStyle(fontSize: 16)),
                Radio(
                  value: "USD",
                  groupValue: destinoCurrency,
                  onChanged: (value) {
                    setState(() {
                      destinoCurrency = value.toString();
                    });
                  },
                ),
                Text('Dólar', style: TextStyle(fontSize: 16)),
                Radio(
                  value: "EUR",
                  groupValue: destinoCurrency,
                  onChanged: (value) {
                    setState(() {
                      destinoCurrency = value.toString();
                    });
                  },
                ),
                Text('Euro', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularConversao,
              child: Text("Converter"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _consultaPreco,
              child: Text("Consultar Preço Bitcoin"),
            ),
            SizedBox(height: 20),
            Text(
              "Preço Bitcoin ${origemCurrency ?? 'Real'}: $preco",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
