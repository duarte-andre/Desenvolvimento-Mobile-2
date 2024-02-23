import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/Matematica': (context) => DisciplinaScreen(nomeDisciplina: 'Matematica'),
        '/Quimica': (context) => DisciplinaScreen(nomeDisciplina: 'Quimica'),
        '/Artes': (context) => DisciplinaScreen(nomeDisciplina: 'Artes'),
        '/Fisica': (context) => DisciplinaScreen(nomeDisciplina: 'Fisica'),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Média'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite o nome do aluno:', // Instrução para o usuário inserir o nome do aluno
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField( // Campo de texto para inserir o nome do aluno
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Nome do aluno',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Matematica'); // Navega para a tela da Matematica
              },
              child: Text('Matematica'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Quimica'); // Navega para a tela da Quimica
              },
              child: Text('Quimica'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Artes'); // Navega para a tela da Artes
              },
              child: Text('Artes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Fisica'); // Navega para a tela da Fisica
              },
              child: Text('Fisica'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisciplinaScreen extends StatefulWidget {
  final String nomeDisciplina;

  const DisciplinaScreen({Key? key, required this.nomeDisciplina}) : super(key: key);

  @override
  _DisciplinaScreenState createState() => _DisciplinaScreenState();
}

class _DisciplinaScreenState extends State<DisciplinaScreen> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomeDisciplina), // Título da tela é o nome da disciplina
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite as notas do aluno para a ${widget.nomeDisciplina}:', // Instrução para o usuário inserir as notas
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField( // Campo de texto para inserir a nota 1
                controller: nota1Controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nota 1',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField( // Campo de texto para inserir a nota 2
                controller: nota2Controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nota 2',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField( // Campo de texto para inserir a nota 3
                controller: nota3Controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nota 3',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adiciona a lógica para calcular a média e determinar se o aluno foi aprovado ou reprovado
                // Obtém as notas inseridas pelo usuário
                double? nota1 = double.tryParse(nota1Controller.text);
                double? nota2 = double.tryParse(nota2Controller.text);
                double? nota3 = double.tryParse(nota3Controller.text);

                // Verifica se todas as notas foram fornecidas
                if (nota1 != null && nota2 != null && nota3 != null) {
                  // Calcula a média
                  double media = (nota1 + nota2 + nota3) / 3;

                  // Determina se o aluno foi aprovado ou reprovado
                  String resultado = media >= 5 ? 'Aprovado' : 'Reprovado';

                  // Exibe o resultado
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Resultado'),
                        content: Text('Média: $media\nSituação: $resultado'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Exibe uma mensagem de erro se alguma nota estiver faltando
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('Por favor, insira todas as notas.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Calcular Média'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpa os controladores de texto quando o widget for descartado
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }
}
