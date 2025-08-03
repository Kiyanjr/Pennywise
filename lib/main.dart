import 'package:flutter/material.dart';
import 'package:expense1_tracker/widgets/expenses.dart';


var kColorScheme=ColorScheme.fromSeed(seedColor: const Color(0xFF0066FF),
brightness: Brightness.light,
);

var kDarkModeScheme=ColorScheme.fromSeed(
  brightness: Brightness.dark,
seedColor: const Color.fromARGB(255, 5,99, 125),
);


void main() {
  runApp(
  MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
    colorScheme: kDarkModeScheme,
  cardTheme: CardThemeData().copyWith(
        color: kDarkModeScheme.inversePrimary,
        margin: const EdgeInsets.symmetric(
        horizontal:14,
        vertical: 7
        ),
      ),
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkModeScheme.primaryContainer,
        ),
      ),
  ),
    theme:ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme:const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.inversePrimary,
        foregroundColor: kColorScheme.inverseSurface,
       elevation: 23.3,
      ),
      cardTheme: CardThemeData().copyWith(
        color: kColorScheme.inversePrimary,
        margin: const EdgeInsets.symmetric(horizontal:14,vertical: 7),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.onSecondaryContainer,
          foregroundColor: kDarkModeScheme.onPrimaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
     titleLarge: TextStyle(fontWeight: FontWeight.bold,color:kColorScheme.onPrimaryContainer,fontSize: 18
     ),
      ),
    ),
      home: Expenses(),
    ),
  );
  
}
