import 'package:flutter/material.dart';

class MyWidget1 extends StatelessWidget {
  const MyWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'My Text Center for testing purpose',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
