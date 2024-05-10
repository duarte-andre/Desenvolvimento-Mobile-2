import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; // pacote que permite a manipulação de banco de dados
import 'package:path/path.dart'; // permite pegar o diretório de onde o bd é criado


void main() async {
  runApp(MaterialApp(
    home:Home(),

  ));
  WidgetsFlutterBinding .ensureInitialized();
  await _insertInitialProdut();

}

//Função para inserir dados no banco de dados
Future<void> _insertInitialProdut() async{
  var database = await _initializeDatabase();
  var ps4 = Product(id: 1, nome:"Ps4", price: 3500);
  var s23 = Product(id: 2, nome:"S23", price: 4500);
  var acer = Product(id: 3, nome:"Ace Nitro", price: 5500);
  await _insertProdut(database, s23);
}

//função para inicializar o banco de dados
Future<Database> _initializeDatabase() async{
  return openDatabase(
    join(await getDatabasesPath(), 'products.db'),
    onCreate: (db, version){
      db.execute(
        'CREATE TABLE products(id INTEGER PRIMARY KEY, nome TEXT, price INTEGER)'
      );
    },
    version:1
  );
}

Future<void> _insertProdut(Database database, Product product) async {
  await database.insert('products', product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
   late Future<List<Product>> _products;
  @override
  void initState() {
    super.initState();
    _products = _fetchProduct();
  }
   Future<List<Product>> _fetchProduct() async {
    var database = await _initializeDatabase();
    final List<Map<String, dynamic>> maps = await database.query('products');

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        price: maps[i]['price'],
      );
    });
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP BD PRODUTOS"),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final _products = snapshot.data!;
            return ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ListTile(
                  title: Text(product.nome),
                  subtitle: Text('Prince: ${product.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}


class Product{
  final int id;
  String nome;
  final int price;
  Product({
    required this.id,
    required this.nome,
    required this.price
  });
   // função para transformar os dados em Map para salvar no banco de dados
  Map<String,dynamic> toMap(){
    return { 'id':id, 'nome':nome, 'price':price};
  }

}

