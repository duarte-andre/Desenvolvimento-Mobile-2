import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedContainerApp());
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void _changeContainer() {
    final random = Random();
    setState(() {
      _width = random.nextDouble() * 300 + 50;
      _height = random.nextDouble() * 300 + 50;
      _color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
      _borderRadius = BorderRadius.circular(random.nextDouble() * 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Feijoada Animated'),
          backgroundColor: Colors.teal,
        ),
        body: GestureDetector(
          onTap: _changeContainer,
          child: Center(
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              child: ClipRRect(
                borderRadius: _borderRadius,
                child: Image.network('https://i.panelinha.com.br/i1/64-bk-9097-39-panelinha-12-02-200635.webp', // Caminho da imagem de exemplo
                  fit: BoxFit.cover, // Ajusta a imagem para preencher o contêiner
                ),
              ),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ),
    );
  }
}
