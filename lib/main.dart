import 'package:flutter/material.dart';
import 'package:flutter_app5/dmi.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Color(0xFF0A0E21)),
      home: DMI(),
    ),
  );
}

