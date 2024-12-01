import 'package:flutter/material.dart';

class DefaultTheme {
 
  static const Color primaryColorDT=Colors.white;
  static const Color secondaryColorDT=Color.fromARGB(242, 38, 37, 37);
  static const Color primaryHoverColorDT=Colors.black;
  static const Color itemColorDT=Colors.black;
  static const Color backgroundColorDT=Color.fromARGB(242, 38, 37, 37);
  static const Color primaryColorLT=Color.fromARGB(241, 176, 174, 174);
  static const Color secondaryColorLT=Colors.white;
  static const Color primaryHoverColorLT=Colors.black;
  static const Color itemColorLT=Colors.black;
  static const Color backgroundColorLT=Colors.grey;
  //static const Color primaryColorDT=Colors.black;
  //static const Color primaryColorLT=Colors.black;


  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColorLT,
    secondaryHeaderColor: Colors.amberAccent,
    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColorLT,
      foregroundColor: Colors.amber
    ),
    
     );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
          backgroundColor: secondaryColorDT, foregroundColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: primaryColorDT, foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: secondaryColorDT, foregroundColor: Colors.white)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColorDT,
        foregroundColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(iconColor: primaryColorDT),
      /* switchTheme: SwitchThemeData(), */
      inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: const TextStyle(color: primaryColorDT),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primaryColorDT),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primaryColorDT),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )));
}
