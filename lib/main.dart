import 'package:flutter/material.dart';
import 'start.dart';
import 'dashboard.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/start',
    routes: {
      '/start': (context) => Start(),
      '/dashboard': (context) => Dashboard(),
    },
  ));
}
