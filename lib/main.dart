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
    darkTheme: ThemeData().copyWith(
    
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromARGB(255, 50, 66, 94),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        titleTextStyle:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 7, 42, 88),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 137, 173, 255),
          backgroundColor: const Color.fromARGB(255, 35, 6, 75)
        )
      ),
      cardTheme:const  CardTheme(
        color:Color.fromARGB(255, 37, 140, 200) ,
        margin: EdgeInsets.all(10)
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.blue[900],
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(backgroundColor: Colors.white),
        ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white)
      ),
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      
    ),
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    home: const ExpensePage()
  )
  );
}