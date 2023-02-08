import 'package:flutter/material.dart';

Map<int,Color> _swatchOpacityPrimary  = {
  900: const Color.fromRGBO(1, 1, 1, 0),
  800: const Color.fromRGBO(1, 1, 1, 1),
  700: const Color.fromRGBO(9, 9, 10, 0.7),
  600: const Color.fromRGBO(9, 9, 10, 0.6),
  500: const Color.fromRGBO(9, 9, 10, 0.5),
  400: const Color.fromRGBO(9, 9, 10, 0.4),
  300: const Color.fromRGBO(9, 9, 10, 0.3), 
  200: const Color.fromRGBO(9, 9, 10, 0.2), 
  100: const Color.fromRGBO(9, 9, 10, 0.1),
  50: const Color.fromRGBO(9, 9, 10, 0.05), 
};

Map<int,Color> _swatchOpacitySecundary  = {
    400: Color.fromARGB(0, 33, 20, 150),
    500: Color.fromARGB(0, 83, 72, 204),
    600: Color.fromARGB(0, 75, 8, 8),
};

abstract class CustomColors {
  static Color red = const Color(0xffDB4437);
  static MaterialColor gray = MaterialColor(0xFF09090A, _swatchOpacityPrimary);
  static MaterialColor purple = MaterialColor(0xFF09090A, _swatchOpacitySecundary);
  static Color green = const Color(0xff047c3f);
  static Color white = Colors.white;
}



Map<String, double> spacing = {
    '1': 8,
    '2': 12.0,
    '3': 16,
    '4': 24,
    '5': 32,
    '6': 48,
};

 Map<String, double> themeBorderRadius = {
    'sm': 12,
    'md': 18,
    'lg': 30,
    'xl': 45,
  };
