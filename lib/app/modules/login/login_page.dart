import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueAccent,
        ),
        Scaffold(
      body: Container(
        child: Center(
          child: Container(
            color: Colors.white,
            width: 300,
            child: Text('data') ,
          ),
        ),
      ),
      ),
      ],
    );
  }
}
