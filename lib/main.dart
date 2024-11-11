import 'package:expense_tracker/pages/expense_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    theme:ThemeData().copyWith(
    
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromARGB(255, 215, 46, 102),
        foregroundColor: Colors.white,
        titleTextStyle:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
      ),
      scaffoldBackgroundColor: Colors.pink[100],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:ElevatedButton.styleFrom(
          foregroundColor: Colors.pink,
          backgroundColor: const Color.fromARGB(255, 255, 186, 209)
        )
      ),
      cardTheme: CardTheme(
        color:Colors.pink[50] ,
        margin: const EdgeInsets.all(10)
      )
    ),
    debugShowCheckedModeBanner: false,
    home: const ExpensePage()
  )
  );
}