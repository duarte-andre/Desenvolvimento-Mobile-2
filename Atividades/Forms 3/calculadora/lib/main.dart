import 'package:flutter/material.dart';
// Importe a biblioteca dart:math

void main() {
  runApp(NavButton());
}

class NavButton extends StatelessWidget {
  const NavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorScreen(),
    );
  }
}

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de fórmulas"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
          bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: 'Login',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.change_history_rounded),
          label: 'Triângulo',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exposure_outlined),
          label: 'Trapézio',
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate_outlined),
          label: 'Lei de Ohm',
          backgroundColor: Colors.brown,
        ),
      ],
      currentIndex: selectIndex,
      selectedItemColor: Colors.white,
      onTap: onItemTapped,
    ),
  );
  }
  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
     });
  }



  static List<Widget> _widgetOptions = <Widget>[
    TelaLogin(),
    TelaTriangulo(),
    TelaTrapezio(),
    TelaOhm(),
  ];
}

class TelaLogin extends StatelessWidget {
  const TelaLogin({Key? key}) : super(key: key);

  static const TextStyle styletext = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGIN', 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
              labelText: 'Nome de Usuário',
              prefixIcon: Icon(Icons.person), // Adiciona um ícone à esquerda do campo de texto
               ),
              ),

            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock)
              ),  
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implemente aqui a lógica de autenticação
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
class TelaTriangulo extends StatefulWidget {
  const TelaTriangulo({Key? key}) : super(key: key);

  @override
  _TelaTrianguloState createState() => _TelaTrianguloState();
}

class _TelaTrianguloState extends State<TelaTriangulo> {
  final TextEditingController baseController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('calcular Área do triângulo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            SizedBox(height: 10),
            
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Base"),
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Altura"),
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            SizedBox(height: 20),
            Text("Área do Triângulo: ${calculateArea()}"), // Exibe a área calculada
          ],
        ),
      ),
    );
  }

  double calculateArea() {
    double base = double.tryParse(baseController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    return (base * altura) / 2;
  }
}

class TelaTrapezio extends StatefulWidget {
  const TelaTrapezio({Key? key}) : super(key: key);

  @override
  State<TelaTrapezio> createState() => _TelaTrapezioState();
}

class _TelaTrapezioState extends State<TelaTrapezio> {
  final TextEditingController baseMaiorController = TextEditingController();
  final TextEditingController baseMenorController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calcular Área do Trapézio',
            style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold)),

            SizedBox(height: 20),

            TextField(
              controller: baseMaiorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Base Maior"),
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            TextField(
              controller: baseMenorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Base Menor"),
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Altura"),
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            SizedBox(height: 20),
            Text("Área do Trapézio: ${calculateArea()}"), // Exibe a área calculada
          ],
        ),
      ),
    );
  }

  double calculateArea() {
    double baseMaior = double.tryParse(baseMaiorController.text) ?? 0;
    double baseMenor = double.tryParse(baseMenorController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    return ((baseMaior + baseMenor) * altura) / 2;
  }
}


class TelaOhm extends StatefulWidget {
  const TelaOhm({Key? key}) : super(key: key);

  @override
  State<TelaOhm> createState() => _TelaOhmState();
}
class _TelaOhmState extends State<TelaOhm> {
  final TextEditingController resistenciaController = TextEditingController();
  final TextEditingController correnteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calcula Primeira Lei de Ohm',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            SizedBox(height: 20),

            TextField(
              controller: resistenciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Resistência (Ω)"),
              
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            TextField(
              controller: correnteController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Corrente (A)"),
              onChanged: (value) {
                setState(() {}); // Atualiza o estado ao mudar o texto
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    double tensao = calcularTensao();
                    return AlertDialog(
                      title: Text("Resultado"),
                      content: Text("Tensão (V): $tensao"),
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
              },
              child: Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }

  double calcularTensao() {
    double resistencia = double.tryParse(resistenciaController.text) ?? 0;
    double corrente = double.tryParse(correnteController.text) ?? 0;

    return resistencia * corrente;
  }
}
