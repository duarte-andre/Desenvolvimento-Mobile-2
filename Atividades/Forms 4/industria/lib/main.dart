import 'package:flutter/material.dart';

void main() {
  runApp(IndustrialMachinesApp());
}

// Classe principal que define o aplicativo
class IndustrialMachinesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configura o aplicativo com o título e o tema definidos
    return MaterialApp(
      title: 'Industrial Machines',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define a página inicial como a lista de máquinas
      home: MachineListPage(),
    );
  }
}

// Página que exibe a lista de máquinas
class MachineListPage extends StatefulWidget {
  @override
  _MachineListPageState createState() => _MachineListPageState();
}

class _MachineListPageState extends State<MachineListPage> {
  // Índice da máquina selecionada na lista
  int _selectedIndex = 0;
  // Lista de máquinas disponíveis na indústria
  List<Machine> _machines = [
    Machine(name: 'Torno', consumption: 100, usageTime: 0),
    Machine(name: 'Fresa', consumption: 150, usageTime: 0),
    Machine(name: 'Furadeira', consumption: 200, usageTime: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Máquinas da industria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibe o consumo de energia da máquina selecionada
            Text(
              'Consumo de Energia da Máquina:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '${_machines[_selectedIndex].calculateEnergyConsumption()} Wh',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Slider para ajustar o tempo de utilização da máquina
            Text(
              'Tempo de Utilização (minutos):',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _machines[_selectedIndex].usageTime.toDouble(),
              min: 0,
              max: 60,
              divisions: 12,
              onChanged: (value) {
                setState(() {
                  _machines[_selectedIndex].usageTime = value.toInt();
                });
              },
            ),
            SizedBox(height: 20),
            // ToggleButtons para selecionar a máquina
            Text(
              'Selecione uma Máquina:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ToggleButtons(
              children: _machines.map((machine) => Text(machine.name)).toList(),
              isSelected: List.generate(_machines.length, (index) => index == _selectedIndex),
              onPressed: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Classe para representar uma máquina industrial
class Machine {
  String name; // Nome da máquina
  int consumption; // Consumo da máquina em Watts
  int usageTime; // Tempo de utilização da máquina em minutos

  // Construtor da classe
  Machine({required this.name, required this.consumption, required this.usageTime});

  // Método para calcular o consumo de energia da máquina
  int calculateEnergyConsumption() {
    return consumption * usageTime; // Retorna o consumo de energia (Watts x minutos)
  }
}
