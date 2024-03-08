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
    TelaProjeto(),
    TelaConsultoria(),
    TelaLaudo(),
    
    
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
        title: Text("SM CONSULTORIA"),
      ),
      body:  Center(
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
            icon: Icon(Icons.app_registration_sharp),
            label: 'Projeto',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined ),
            label: 'Consultoria',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined ),
            label: 'laudo',
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
              child: Image.network('https://cdn.gestaumlab.com.br/base/840/518/e8d/empresa-de-consultoria-empresarial.jpg'
              ),
            ),

            SizedBox(height: 20),

            Text(
              'SEJA BEM-VINDO Á SM CONSULTORIA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Desfrute de nossos melhores serviços!',
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
  
class TelaProjeto extends StatelessWidget {
  const TelaProjeto({super.key});
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
              child: Image.network('https://cdn.evg.gov.br/cursos/553_EVG/imagem_curso_553.png', fit: BoxFit.fill,
              ),
            ),
            
            SizedBox(height: 20),

            Text(
              
              'Principais Projetos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Projetos comunitários',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Estágios em empresas e agências.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Competições de criação de campanhas.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Preço: xxxxx',
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

class TelaConsultoria extends StatelessWidget {
  const TelaConsultoria({super.key});
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
              child: Image.network('https://www.leandrotelles.com.br/wp-content/uploads/2018/12/consultoria-em-marketing-digital.png'),
            ),

           
             
            Text(
              
              'Consultoria:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Análise de mercado e estratégias de marca.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Desenvolvimento de campanhas publicitárias.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Apresentação de recomendações aos clientes.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

             Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Preço: xxxxxx',
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

class TelaLaudo extends StatelessWidget {
  const TelaLaudo({super.key});
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
              width: 420,
              child: Image.network('https://www.ispblog.com.br/wp-content/uploads/2016/06/como-elaborar-um-laudo-tecnico-sem-erros20546.jpg'),
            ),

            SizedBox(height: 20),
            Text(
              
              'Elaboração de Laudos:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 20), // Adiciona um espaço entre o texto e a lista de itens
            // Lista de itens com bordas em volta de cada item
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Identificação de oportunidades e desafios.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Recomendações para melhorias e otimização.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Elaboração de laudos para empresas.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  'Preço: xxxxx',
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