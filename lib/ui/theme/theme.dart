import 'package:flutter/material.dart';
import 'package:free_pad/constant/shared_preference.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Color(0xffCCD6F6),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xff0a192f),
    scaffoldBackgroundColor: Color(0xff0a192f),
    iconTheme: IconThemeData(
      color: Color(0xff64ffda)
    ),
    textTheme: TextTheme(
        headline2: TextStyle(
          color:Color(0xff64ffda),
          fontSize: 96,
          wordSpacing: -1.5,
          fontWeight: FontWeight.w300
        ),
        headline5: TextStyle(
          color:Color(0xff64ffda),
          fontSize: 24,
          fontWeight: FontWeight.w400
        ),
        headline6: TextStyle(
          color:Color(0xff64ffda),
          fontSize: 20,
          wordSpacing: -0.15,

          fontWeight: FontWeight.w400
        ),
        bodyText1: TextStyle(
          color:Color(0xff64ffda),
          fontSize: 16,
          wordSpacing: -0.15,
          fontWeight: FontWeight.w300
        ),

    ),
    fontFamily: 'inter',
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    fontFamily: 'inter',
    dividerColor: Colors.white54,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    textTheme: TextTheme(
        headline2: TextStyle(
          color:Colors.black,
          fontSize: 96,
          wordSpacing: -1.5,
          fontWeight: FontWeight.w300
        ),
        headline5: TextStyle(
          color:Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w400
        ),
        headline6: TextStyle(
          color:Colors.black,
          fontSize: 20,
          wordSpacing: -0.15,
          fontWeight: FontWeight.w400
        ),
        subtitle1: TextStyle(
          color:Colors.black,
          fontSize: 16,
          wordSpacing: -0.15,
          fontWeight: FontWeight.w300
        ),
        bodyText1: TextStyle(
          color:Colors.black,
          fontSize: 16,
          wordSpacing: -0.15,
          fontWeight: FontWeight.w300
        ),

    ),
    
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
