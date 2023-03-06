import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const zubi());
}

class zubi extends StatelessWidget {
  const zubi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Zubi :This is my First App"),
          ),
        ),
      ),
    );
  }
}
