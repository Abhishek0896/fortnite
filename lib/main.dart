import 'package:flutter/material.dart';
import 'package:fortnite/Home.dart';
import 'package:fortnite/Item.dart';

void main() {
  runApp(new MaterialApp(home: new Home(),
      routes: {
        Item.routeName: (ctx) => Item()
      },
  ));
}


