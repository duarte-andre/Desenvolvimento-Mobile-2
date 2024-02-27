import 'package:flutter/material.dart';

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
        title: Text("Aplicativo coleta de dados"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sensor_occupied_sharp),
            label: 'User',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule_sharp),
            label: 'Sexo',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel_sharp),
            label: 'Estado',
            backgroundColor: Colors.purple,
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
    TelaHome(),
    TelaColeta(),
    RadioButton(),
    TelaEstado(), // Adicionado TelaEstado aqui
  ];
}

class TelaHome extends StatelessWidget {
  const TelaHome({Key? key}) : super(key: key);

  static const TextStyle styletext = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Seja Bem-vindo",
                  style: styletext,
                ),
                SizedBox(height: 10),
                Text(
                  "A seguir preencha alguns dados",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TelaColeta extends StatefulWidget {
  const TelaColeta({Key? key}) : super(key: key);

  @override
  State<TelaColeta> createState() => CampotextoState();
}

class CampotextoState extends State<TelaColeta> {
  int? selectName;
  static const TextStyle styletext = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final TextEditingController ctexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Digite seu nome"),
              controller: ctexto,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print(ctexto.text);
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int? selectOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Qual gênero se identifica:", 
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

        SizedBox(height: 10),

        RadioListTile<int>(
          title: Text("Masculino"),
          value: 1,
          groupValue: selectOption,
          onChanged: (value) {
            setState(() {
              selectOption = value;
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Feminino"),
          value: 2,
          groupValue: selectOption,
          onChanged: (value) {
            setState(() {
              selectOption = value;
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Outro"),
          value: 3,
          groupValue: selectOption,
          onChanged: (value) {
            setState(() {
              selectOption = value;
            });
          },
        ),
        Text("Radio button opção $selectOption"),
      ],
    );
  }
}

class TelaEstado extends StatefulWidget {
  const TelaEstado({Key? key}) : super(key: key);

  @override
  State<TelaEstado> createState() => StateCivil();
}

class StateCivil extends State<TelaEstado> {
  int? selectOpt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Em qual estado civil se encontra:", 
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

        SizedBox(height: 10),

        RadioListTile<int>(
          title: Text("Solteiro"),
          value: 1,
          groupValue: selectOpt,
          onChanged: (value) {
            setState(() {
              selectOpt = value;
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Casado"),
          value: 2,
          groupValue: selectOpt,
          onChanged: (value) {
            setState(() {
              selectOpt = value;
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Divorciado"),
          value: 3,
          groupValue: selectOpt,
          onChanged: (value) {
            setState(() {
              selectOpt = value;
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Viúvo"),
          value: 4, // Alterado o valor para 4
          groupValue: selectOpt,
          onChanged: (value) {
            setState(() {
              selectOpt = value;
            });
          },
        ),
        Text("Radio button opção $selectOpt"),
      ],
    );
  }
}
