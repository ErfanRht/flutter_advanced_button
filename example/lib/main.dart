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
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: Advanced3DButton(
                      child: Text(
                        "Advanced3DButton",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        print("Tapped");
                      })),
              Center(
                  child: AdvancedRoundedButton(
                width: 250,
                child: Text(
                  "AdvancedRoundedButton",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  print("Tapped");
                },
                animationSpeed: 275,
              )),
              Center(
                  child: AdvancedFolidButton(
                      width: 270,
                      foldWidth: 200,
                      child: Text(
                        "AdvancedFoldingButton",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        print("Tapped");
                      })),
            ],
          ),
        ));
  }
}
