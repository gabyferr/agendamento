import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimeiraIntroPage extends StatelessWidget {
  const PrimeiraIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 32,
          children: [
            Text(
              "Seja Bem Vindo!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/img/img_intro.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Modular.to.navigate("/intro2");
                  },
                  child: Text(
                    "Próxima pagina",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Modular.to.navigate("/intro2");
                  },
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                  iconSize: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
