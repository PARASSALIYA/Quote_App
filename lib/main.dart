import 'package:flutter/material.dart';
import 'package:quote_app/utils/routes.dart';

void main() {
  runApp(
    QuoteApp(),
  );
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queue App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}
