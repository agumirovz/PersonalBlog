import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color(0xFFF2F2F6),
      child: Center(
        child: Text('Home page'),
      ),
    );
  }
}
