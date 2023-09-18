import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
class Mythemedata{
  static const String routeName="theme";


  static ThemeData LightTheme=ThemeData(
    scaffoldBackgroundColor: Lightgreen,
      
      appBarTheme:AppBarTheme(


      ),
    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: PrimaryColor,
      unselectedItemColor: Colors.grey,

      
    )
  );
  static ThemeData DarkTheme=ThemeData();



}

