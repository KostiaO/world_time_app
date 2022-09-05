import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/loader.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/loader',
    routes: {
      '/': (context) => Home(),
      '/location': (context) => ChooseLoaction(),
      '/loader': (context) => Loader()
    },
  ));
}
