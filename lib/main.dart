import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    title: 'World TIme',
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/': (context) => Loading(),
    },
  ));
}
