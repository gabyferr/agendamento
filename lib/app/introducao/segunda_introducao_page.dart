import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SegundaItroPage extends StatelessWidget {
  const SegundaItroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Wrap(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 32,
          children: [
            Text(
              "Agendamento fácil e rápido em clicks!!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/img/img_intro2.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Modular.to.navigate("/");
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Modular.to.navigate("/");
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
