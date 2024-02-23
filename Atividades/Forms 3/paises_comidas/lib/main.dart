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
   TelaBrazil(),
    /*Text(
      'Index 1: Business',
      style: optionStyle,
    ),*/
    TelaHermanos(),
    TelaBoliv(),
    TElaChile(),
    
    
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
        title: Text("Receitas South America"),
      ),
      body:  Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.south_america),
            label: 'Brazil',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.south_america),
            label: 'Argentina',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.south_america),
            label: 'Bolívia',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.south_america),
            label: 'Chile',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: selectIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    
        
          
          

    );
  }
}

class TelaBrazil extends StatelessWidget {
  const TelaBrazil({super.key});
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
              width: 410,
              child: Image.network('https://i.panelinha.com.br/i1/64-bk-9097-39-panelinha-12-02-200635.webp', fit: BoxFit.fill,
              ),
            ),
           
             SizedBox(height: 20),

            Text(              
              'Principais caracteristicas da feijoada:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'A feijoada, prato típico do Rio de Janeiro, é amplamente consumida em todo o Brasil, sendo considerada um dos pilares da gastronomia nacional.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                 'Surgiram várias variações da receita, mas a feijoada completa tradicional inclui todas as carnes salgadas, servidas com acompanhamentos como'
                   'rodelas de laranja, couve refogada, arroz e farofa.',
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
  
class TelaHermanos extends StatelessWidget {
  const TelaHermanos({super.key});
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
              width: 410,
              child: Image.network('https://www.melhoresdestinos.com.br/wp-content/uploads/2020/04/comidas-tipicas00002.jpg', fit: BoxFit.fill,
              ),
            ),

             SizedBox(height: 20),

            Text(
              
              'Principais caracteristicas do Choripán:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'O choripán é um tradicional sanduíche argentino também típico do Uruguai que é consumido como uma refeição rápida.  ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  ' Consiste em duas fatias de pão, entre as quais é colocada uma linguiça (chorizo criollo, uma linguiça maior e mais condimentada), além de ser temperado com chimichurri e salsa criolla.',
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

class TelaBoliv extends StatelessWidget {
  const TelaBoliv({super.key});
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
              child: Image.network('https://www.melhoresdestinos.com.br/wp-content/uploads/2020/04/comidas-tipicas-100004.png', fit: BoxFit.fill,),
            ),

            SizedBox(height: 20),

            Text(
              
              'Principais Caracteristicas do Majao:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Este autêntico prato boliviano consiste em carne seca ou em alguns casos frango desfiado que é cozida com arroz, mandioca, legumes, cebola e tomate.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'O prato geralmente é aromatizado com pimenta vermelha ou amarela, e costuma ser servido com um ovo frito por cima e acompanhado banana frita em fatias.',
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

class TElaChile extends StatelessWidget {
  const TElaChile({super.key});
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
              child: Image.network('https://www.chileanfoodandgarden.com/wp-content/uploads/2019/02/ceviche-chileno-9-1024x683-800x600.jpg', fit: BoxFit.fill,),
            ),

            SizedBox(height: 20),

            Text(
              
              'Principais caracteristicas do Ceviche:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'O ceviche chileno é um prato refrescante e vibrante, perfeito para o clima quente. É frequentemente apreciado como um aperitivo ou refeição leve e é uma ótima maneira de destacar a abundância de frutos do mar frescos ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'disponíveis ao longo da extensa costa do Chile. É delicioso e um testemunho da diversidade culinária e riqueza cultural do Chile.',
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