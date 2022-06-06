import 'package:flutter/material.dart';

class MyButton1 extends StatelessWidget {
  Future<Null> Function() onPressed;

  MyButton1({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('textButtonWithStyle'),
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        primary: Colors.purple,
        textStyle: TextStyle(fontSize: 30.0),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  const MyButton2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.home),
      label: Text("Home"),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shadowColor: Colors.orange,
      ),
    );
  }
}
