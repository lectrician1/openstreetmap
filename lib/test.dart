import 'package:flutter/material.dart';

void main() => runApp(Test());

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: RawMaterialButton(
        fillColor: Colors.red,
        onPressed: () {},
        child: Text('hi'),
      ),
    ));
  }
}
