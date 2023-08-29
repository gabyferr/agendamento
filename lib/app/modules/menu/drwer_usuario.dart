import 'package:flutter/material.dart';

class DrawerUsuario extends StatelessWidget {
  const DrawerUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      
      child: ListView(
        children: <Widget>[
        DrawerHeader(  
         decoration: const BoxDecoration(
              color: Colors.blue,         
          ),
          child:Wrap(
            runAlignment: WrapAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 55,top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                    Icons.account_circle,size: 70, 
                    color: Colors.white),
                     Text("Nome Sobrenome", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ), 
        Column(
         children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: Text("Meus dados",
              style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),         
            ),
          ),
         ],
        ),
        Divider(    
           height: 5,
           color: Colors.black12,    
          ),  
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("Nome Completo:",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),         
              ),      
              Text("Mari Cordeiro Silva",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300
                ),         
              ), 
                     ],
                    ),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("Nome Completo:",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),         
              ),      
              Text("Mari Cordeiro Silva",
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300
                    ),         
                  ), 
                ],
              ),
            ),       
        ],
      ),
    );
  }
}