import 'package:flutter/material.dart';
import 'package:first_flutter/pages/home.dart';
import 'package:first_flutter/pages/loading.dart';
import 'package:first_flutter/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
