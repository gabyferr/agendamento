import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      children: [],
    );
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 50),
                  child: Row(
                    children: [
                      const Text(
                        'CATEGORIAS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: ListView.builder(
          //           itemBuilder: (context, index) => Card(
          //             child: ListTile(
          //               title: Text('kkkk'),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.only(top: 10, right: 200),
          //   child: Column(children: [
          //     Text(
          //       'kkkk',
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       // textAlign: TextAlign.left,
          //     )
          //   ]),
          // )
        ],
      ),
    );
  }
}
