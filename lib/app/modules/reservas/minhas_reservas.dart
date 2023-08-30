import 'package:agendamento/app/modules/menu/drawer_menu.dart';
import 'package:agendamento/app/modules/reservas/reserva_controller.dart';
import 'package:agendamento/app/modules/reservas/reserva_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class MinhasReservas extends StatefulWidget {
   MinhasReservas({
    Key? key,
  }) : super(key: key);


  @override
  State<MinhasReservas> createState() => _MinhasReservasState();
   late ReservaModel reserva;

}
class _MinhasReservasState extends State<MinhasReservas> {
  @override
  void initState() {
    print(Modular.get<ReservaController>().listAllByUser(11));
    super.initState();
  }

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
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          'Suas Reservas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (ontext, index) {
                    return Card(
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          top: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Procedimento:',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF091B3A)),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(left: 85),
                                  child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.edit,
                                        size: 30, color: Colors.blueAccent),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.delete_forever,
                                        size: 35, color: Colors.blueAccent),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Descrição: ',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Proficional',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                "text",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Hora',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
