import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SegundaItroPage extends StatefulWidget {
  const SegundaItroPage({super.key});

  @override
  State<SegundaItroPage> createState() => _SegundaItroPageState();
}

class _SegundaItroPageState extends State<SegundaItroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Center(
          child: Wrap(
            children: [
              // Image(
              //   image: 
              //   AssetImage('assets/img_intro.png'),
              //   ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () { 
                      Modular.to.navigate("/");
                       },
                      child: Text("Entrar", 
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,    
                    ),
                    ),
                    ),
                    IconButton(onPressed: () { 
                       Modular.to.navigate("/");
                    }, 
                icon: Icon(Icons.arrow_forward), color: Colors.white, iconSize: 30,)
                  ],
                ),  
            ],
          ),
        ),  
      ),
    );
  }
}