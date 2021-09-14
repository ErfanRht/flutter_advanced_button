import 'package:flutter/material.dart';
import 'package:flutter_advanced_button/flutter_advanced_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Advanced Button Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Center(
            child: AdvancedButton(
          type: AdvancedButtonType.Folding,
          child: Text(
            'Click me!',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            print("Tapped");
          },
        )));
  }
}
