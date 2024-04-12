import 'package:flutter/material.dart';

class Constants{
  static String nameApp = 'BarberShopApp';
  static double fontSizeMin = 20;
  static double fontSizeMax = 30;
  static ThemeMode themeApp = ThemeMode.light;
  static String light = 'light';
  static String dark = 'dark';
  static String keyPix = 'cdcff03e-0253-4f1e-bf4a-27bd584f5c7b';
  static DateTime firstDay = DateTime.now();
  static DateTime lastDay = DateTime.utc(2024, 12, 31);
  
  static List<String> weekDays = [
    'Domingo',
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado'
  ];

  static List<String> months = [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro'
  ];
}