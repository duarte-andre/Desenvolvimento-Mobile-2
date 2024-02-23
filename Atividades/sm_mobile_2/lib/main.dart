import 'package:flutter/material.dart';

void main() {
  runApp(NavBotton());
}

class NavBotton extends StatelessWidget {
  const NavBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Navigator_screen(),
    );
  }
}

class Navigator_screen extends StatefulWidget {
  const Navigator_screen({super.key});

  @override
  State<Navigator_screen> createState() => _Navigator_screenState();

}

class _Navigator_screenState extends State<Navigator_screen> {
  int selectIndex =0; // variavel pela escolha do widget bar
  // Constante para definir caracteristicas do texto
  static const TextStyle optionStyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold); 
  // Cria lista de widgets 
  static const List<Widget> _widgetOptions = <Widget>[   
      
   /*Text(
      'Index 0: School',
      style: optionStyle,
    ), */
   // Tela1() ,  
   TelaHome(),
    /*Text(
      'Index 1: Business',
      style: optionStyle,
    ),*/
    TelaAgro(),
    TelaHealth(),
    TelaBusuness(),
    
    
  ];
  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
      
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SM MOBILE"),
      ),
      body:  Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Industry',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: 'Agriculture',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            label: 'Health',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: 'Business',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: selectIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    
        
          
          

    );
  }
}

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});
 static const TextStyle styletext =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 400,
              child: Image.network('https://s3.amazonaws.com/bucket.sankhya/sankhya/wp-content/uploads/2021/10/14120207/industria-4-0.png'
              ),
            ),
            Text(
              'Principais Informações da industria:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Taxa de crescimento da produção industrial no último trimestre: 4.2%',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Número de novas fábricas inauguradas no último ano: 23',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Investimento total em pesquisa e desenvolvimento na indústria: 12.5 bilhões',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
  
class TelaAgro extends StatelessWidget {
  const TelaAgro({super.key});
 static const TextStyle styletext =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 300,
              child: Image.network('https://services.meteored.com/img/article/com-termino-do-la-nina-confirmado-como-o-agro-deve-reagir-no-brasil-1679239437776_1280.jpeg'
              ),
            ),
            Text(
              
              'Principais Informações do Agro:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Produção de grãos na última safra: 58 milhões de toneladas',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Número de fazendas familiares no país: 2.3 milhões',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Exportação de produtos agrícolas no último ano: 32 bilhões',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class TelaHealth extends StatelessWidget {
  const TelaHealth({super.key});
 static const TextStyle styletext =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 400,
              child: Image.network('https://www.gov.br/saude/pt-br/assuntos/saude-brasil/eu-quero-me-exercitar/noticias/2022/voce-promove-saude/texto-20-o-que-e-e-o-que-nao-e-saude.png'),
            ),
            Text(
              
              'Principais Informações sobre Saúde:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Taxa de vacinação contra a gripe no último trimestre: 68%',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Despesas governamentais com saúde pública: 45 bilhões',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Expectativa de vida média: 78 anos',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class TelaBusuness extends StatelessWidget {
  const TelaBusuness({super.key});
 static const TextStyle styletext =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 400,
              child: Image.network('https://it.telkomuniversity.ac.id/wp-content/uploads/2023/03/image-6.jpeg'),
            ),
            Text(
              
              'Principais Informações Economia:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Taxa de crescimento do PIB no último ano: 3.8%',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Reservas cambiais do país: 120 bilhões',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Taxa de desemprego: 5.2%',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}