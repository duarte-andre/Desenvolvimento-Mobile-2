import 'package:flutter/material.dart';

void main() {
  runApp(ElectricityBillApp());
}

class ElectricityBillApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electricity Bill Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _consumptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _electricityRate = 0.65;
  double _billAmount = 0.0;

  void _calculateBill() {
    if (_formKey.currentState!.validate()) {
      double consumption = double.parse(_consumptionController.text);
      setState(() {
        _billAmount = consumption * _electricityRate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _consumptionController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Consumo de (Kw/h)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter consumption';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBill,
                child: Text('Calcular Preço'),
              ),
              SizedBox(height: 20),
              Text(
                'Preço: R\$ $_billAmount',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
