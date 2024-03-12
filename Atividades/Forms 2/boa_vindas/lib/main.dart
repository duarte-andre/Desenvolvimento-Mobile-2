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
        '/': (context) => WelcomeScreen(),
        '/shopping': (context) => ShoppingScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boas-vindas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao nosso aplicativo!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shopping');
              },
              child: Text('Ir para a loja'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  Map<String, int> cart = {}; // Mapa para armazenar itens no carrinho
  Map<String, double> prices = {
    'Banana': 2.0,
    'Maçã': 1.5,
    'Abacate': 3.0,
  }; // Mapa para armazenar preços dos itens

  double calculateTotalPrice() {
    double total = 0.0;
    cart.forEach((item, quantity) {
      total += prices[item]! * quantity;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens para comprar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lista de itens para comprar:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            for (var item in prices.keys)
              Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item,
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (cart.containsKey(item) &&
                                    cart[item]! > 0) {
                                  cart[item] = cart[item]! - 1;
                                }
                              });
                            },
                          ),
                          Text('${cart[item] ?? 0}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                cart[item] = (cart[item] ?? 0) + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    'R\$ ${(prices[item]! * (cart[item] ?? 0)).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Preço total: R\$ ${calculateTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
 