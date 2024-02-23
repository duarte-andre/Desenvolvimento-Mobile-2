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
        '/basketball': (context) => BasketballScreen(),
        '/soccer': (context) => SoccerScreen(),
        '/nfl': (context) => NFLScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha um esporte:',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/basketball');
              },
              child: Text('Basquete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/soccer');
              },
              child: Text('Futebol'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/nfl');
              },
              child: Text('NFL'),
            ),
          ],
        ),
      ),
    );
  }
}

class BasketballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basquete'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jogadores de Basquete:',
              style: TextStyle(fontSize: 24),
            ),
            // Lista de jogadores e suas estatísticas de basquete
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Michael Jordan - Pontos: 32.292, Assistências: 5.633',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Giannis Antetokounmpo - Pontos: 12.000, Assistências: 2.000',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Jayson Tatum - Pontos: 5.000, Assistências: 900',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoccerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futebol'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jogadores de Futebol:',
              style: TextStyle(fontSize: 24),
            ),
            // Lista de jogadores e suas estatísticas de futebol
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Neymar - Gols: 434, Assistências: 257',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Messi - Gols: 821, Assistências: 303',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Rolnaldinho - Gols: 280, Assistências: 137',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NFLScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jogadores da NFL:',
              style: TextStyle(fontSize: 24),
            ),
            // Lista de jogadores e suas estatísticas da NFL
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Jerry Rice - Touchdowns: 208',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Emmitt Smith - Touchdowns: 175',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'LaDainian Tomlinson - Touchdowns: 162',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
