import 'package:flutter/material.dart';
import 'package:worldmap_app/pages/home.dart';
import 'package:worldmap_app/pages/location.dart';
import 'package:worldmap_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loading() ,
      'home/': (context) => home() ,
      'location/': (context) => location(),


    },
  ));
}
