import 'package:agendamento/app/modules/menu/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomeReservas extends StatefulWidget {
  const HomeReservas({super.key});

  @override
  State<HomeReservas> createState() => _HomeReservasState();
}

class _HomeReservasState extends State<HomeReservas> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blueAccent,
                Colors.white,
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: DrawerMenu(),
          appBar:AppBar(
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30,),
              child: Column(
                children: [
                  ListTile(
                    title: Center(child: Text('Suas Reservas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 30),
                child: ListBody(children: [
                  Card(
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20, ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                             
                              Container(alignment: Alignment.topCenter,
                               padding: EdgeInsets.only(left: 20),
                                child: Text('Procedimento:',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Color(0xFF091B3A)),
                                ),
                              ),
                              //  SizedBox(width: 40),
                              Container(alignment: Alignment.topRight,
                              padding:EdgeInsets.only(left: 85) ,
                                child: IconButton(onPressed: () => {}, icon: Icon(Icons.edit, size: 30, color:Colors.blueAccent),
                                ),                                
                                ),
                                SizedBox(width: 10,),
                                Container(alignment: Alignment.topRight,
                                child: IconButton(onPressed: () => {}, icon: Icon(Icons.delete_forever, size: 35, color:Colors.blueAccent),
                                ),
                                ),
                            ],
                          ),                    
                          Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text('informações', style: TextStyle(fontSize: 20),
                            ),
                            ),                     
                          Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text('Proficional', style: TextStyle(fontSize: 20),
                            ),
                            ),
                            Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text('Data', style: TextStyle(fontSize: 20),
                            ),
                            ),
                            Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text('Hora', style: TextStyle(fontSize: 20),
                            ),
                            ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
        
        ),
      ],
    );
  }
}