import 'package:e_commerce/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.white,
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red[900],
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.redAccent),
      ),
    
    home:Login() ,
    
  ));
}
