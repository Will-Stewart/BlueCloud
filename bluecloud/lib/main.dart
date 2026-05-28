import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blue Cloud',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blue Cloud'),
        ),
        body: Center(
          child: Text('Welcome to Blue Cloud!'),
        ),
      ),
    );
  }
}
