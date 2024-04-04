import 'package:e_commerce/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.white,
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue[600],
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Colors.white),
      ),
    
    home:Login() ,
    
  ));
}