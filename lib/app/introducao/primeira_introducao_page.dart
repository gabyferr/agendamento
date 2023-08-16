import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimeiraIntroPage extends StatefulWidget {
  const PrimeiraIntroPage({super.key});

  @override
  State<PrimeiraIntroPage> createState() => _PrimeiraIntroPageState();
}

class _PrimeiraIntroPageState extends State<PrimeiraIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Center(
          child: Wrap(
            children: [
              Text("Seja Bem Vindo!",
              style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,    
                    ),
              ),
              // Card(child: Image.asset('assets/img/img_intro.png') ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () { 
                        Modular.to.navigate("/intro2"); 
                        },
                      child: Text("Próxima pagina", 
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,    
                    ),
                    ),
                    ),
                    IconButton(onPressed: () {
                      Modular.to.navigate("/intro2");
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
