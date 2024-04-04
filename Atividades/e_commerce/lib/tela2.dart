import 'package:flutter/material.dart';

class Telaprodutoscadastro extends StatefulWidget {
  const Telaprodutoscadastro({super.key});

  @override
  State<Telaprodutoscadastro> createState() => _TelaprodutoscadastroState();
}

class _TelaprodutoscadastroState extends State<Telaprodutoscadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estoque"),
        backgroundColor: Colors.blue[600],
      ),
      body: Column(
        children: [
          
         Produtos(nomeprod: "Creatina", img: "https://imgs.search.brave.com/NBw1BsW7DYYmAPvgwM4wHkjl8oTWtoYLGY7Ci5RNG1Y/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTE0T0w2d2E5Vkwu/anBn",qtde: 10, valorprod: 45.00),
         Produtos(nomeprod: "Whey", img: "https://www.gsuplementos.com.br/upload/produto/imagem/m_medium-whey-protein-1kg-growth-supplements.png",qtde: 10, valorprod: 61.00),
         Produtos(nomeprod: "BCAA", img: "https://www.gsuplementos.com.br/upload/produto/imagem/m_bcaa-10-1-1-200g-em-p-growth-supplements.jpg", qtde: 15, valorprod: 50.40),
         Produtos(nomeprod: "Termogênico", img: "https://www.gsuplementos.com.br/upload/produto/imagem/m_hot-termog-nico-60-comprimidos-growth-supplements.webp",qtde: 10, valorprod: 38.00)
         
        ],
      ),
    );
  }
}

class Produtos extends StatefulWidget {
   
  final String nomeprod;
  final String img;
  final double valorprod;
  final int qtde;
  Produtos({required this.nomeprod, required this.img,required this.qtde, required this.valorprod});
  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  int cont =0;
  @override
  Widget build(BuildContext context) {
    return        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 150,height: 150,decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey,
              
            
              ),
              child: Image.network(widget.img,fit: BoxFit.fill,),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.nomeprod} ",style: TextStyle(fontSize: 18),),
                Text("Quantidade $cont",style: TextStyle(fontSize: 18),),
                Text("Valor R\$ ${widget.valorprod} ",style: TextStyle(fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
              
                  children: [
                    Text("Qtde:",style: TextStyle(fontSize: 18),),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        
                        setState(() {
                          cont++;
                        });
                      }, child: Icon(Icons.add, color: Colors.white,)),
                    ),
                     ElevatedButton(onPressed: (){
                      
                      setState(() {
                        cont--;
                      });
                    }, child: Icon(Icons.restore, color: Colors.white,)),
                  ],
                ),
                
              ],
              
            ),
            
            
            
          ],
        );
      
    
    
  }
}