import 'package:flutter/material.dart';

class Telacliente extends StatefulWidget {
  const Telacliente({super.key});

  @override
  State<Telacliente> createState() => _TelaclienteState();
}

class _TelaclienteState extends State<Telacliente> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loja Online"),
        backgroundColor: Colors.blue[600],
      ),
      body:SingleChildScrollView(
        child: Column(
        children: [
          
        Produtos(nomeprod: "Creatina", img: "https://imgs.search.brave.com/NBw1BsW7DYYmAPvgwM4wHkjl8oTWtoYLGY7Ci5RNG1Y/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTE0T0w2d2E5Vkwu/anBn",qtde: 10, valorprod: 45.00),
         Produtos(nomeprod: "Whey", img: "https://www.gsuplementos.com.br/upload/produto/imagem/m_medium-whey-protein-1kg-growth-supplements.png",qtde: 10, valorprod: 61.00),
         Produtos(nomeprod: "BCAA", img: "https://www.gsuplementos.com.br/upload/produto/imagem/m_bcaa-10-1-1-200g-em-p-growth-supplements.jpg", qtde: 15, valorprod: 50.40),
         Produtos(nomeprod: "Termogênico", img: "https://www.gsuplementos.com.br/upload/produto/imagem/m_hot-termog-nico-60-comprimidos-growth-supplements.webp",qtde: 10, valorprod: 38.00)
        ],
      ),
    )
  );
  }
}

class Produtos extends StatefulWidget {
   
  final String nomeprod;
  final String img;
  double valorprod;
  int qtde;
  Produtos({required this.nomeprod, required this.img,required this.qtde, required this.valorprod});
  @override
  State<Produtos> createState() => _ProdutosState();
}
double? total;
class _ProdutosState extends State<Produtos> {
  
  int cont =0;
  
   _calculartotal(){

    
    setState(() {
      total = cont * widget.valorprod;
      
    });   
    
  }
  _limpar(){
    setState(() {
      
      cont =0;
      total =0;

    });
  }
  @override
  Widget build(BuildContext context) {
    return        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 125,height: 125,decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey,
              
            
              ),
              child: Image.network(widget.img,fit: BoxFit.fill,),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.nomeprod} ",style: TextStyle(fontSize: 18, color:Colors.white),),
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
                      }, child: Icon(Icons.add, color: Colors.white),
                    ),)
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: _calculartotal, 
                      child: Text("Calcular",   style: TextStyle(color: Colors.white),),
                      
                      
                      ),
                    ),
                    ElevatedButton(onPressed: _limpar,
                    child:Text("Esvaziar", style: TextStyle(color: Colors.white),),
                    
                    
                    ),
                  ],
                ),
                
                Text("Valor total ${total}"),

              ],
              
              
            ),
            
            
            
          ],
        );
      
    
    
  }
}