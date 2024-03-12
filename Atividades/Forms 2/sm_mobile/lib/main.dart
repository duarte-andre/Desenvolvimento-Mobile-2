import 'package:flutter/material.dart';

void main() {
  runApp(PersonalInfoApp());
}

class PersonalInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coleta de Dados Pessoais',
      home: PersonalInfoScreen(),
    );
  }
}

class PersonalInfoScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações Pessoais'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                hintText: 'Digite seu nome',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Idade:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(
                hintText: 'Digite sua idade',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Endereço:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: enderecoController,
              decoration: InputDecoration(
                hintText: 'Digite seu endereço',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Digite seu email',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Telefone:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(
                hintText: 'Digite seu telefone',
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _submitData(context);
                },
                child: Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData(BuildContext context) {
    // Aqui você pode acessar os dados digitados nos controladores de texto
    String nome = nomeController.text;
    String idade = idadeController.text;
    String endereco = enderecoController.text;
    String email = emailController.text;
    String telefone = telefoneController.text;

    // Aqui você pode fazer o que quiser com os dados, como enviar para um servidor ou armazenar localmente
    print('Nome: $nome');
    print('Idade: $idade');
    print('Endereço: $endereco');
    print('Email: $email');
    print('Telefone: $telefone');

    // Exemplo de navegação para uma nova tela após o envio dos dados
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => NovaTela()));
  }
}
