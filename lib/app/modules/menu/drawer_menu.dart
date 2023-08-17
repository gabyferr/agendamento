
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
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
                  padding: const EdgeInsets.only(top: 50, left: 50, ),
                  child: Row(
                    children: [
                      const Text(
                        'CATEGORIAS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
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
         Container(
          child:  ListTile(title: TextButton(onPressed: () { Modular.to.navigate('/'); },
          child: Text('Página inicial',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),), 
                ),                 
         ),  
          Divider(
            height: 10,    
            ),
         Container(
          child:  ListTile(title: TextButton(onPressed: () { Modular.to.navigate('/reservas'); },
          child: Text('Minhas Reservas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),), 
                ),                 
         ),  
          Divider(    
           height: 10,    
          ),
          Container(
          child:  ListTile(title: TextButton(onPressed: () { Modular.to.navigate('/login'); },
          child: Text('Sair',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),), 
                ),                 
         ),  
          Divider(    
           height: 5,    
          ),
        ],     
      ),
    );
  }
}
