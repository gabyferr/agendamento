import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_model.dart';
import 'package:flutter/material.dart';

import 'package:dart_date/dart_date.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuarioModel usuarioModel = UsuarioModel();
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
          appBar: AppBar(
            backgroundColor: Color(0xFFFFFFFF),
          ),
          body: Container(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 35,
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'DATA DO COMPROMISSO',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),

                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Selecione uma data e hora',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Card(
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Nome do procedimento',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Text('informações')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text('data'),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    OutlinedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blueAccent)),
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.now().addMonths(2),
                                          );
                                        },
                                        child: Text(
                                          'data',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text('hora'),
                                        SizedBox(
                                          width: 80,
                                        ),
                                        OutlinedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blueAccent)),
                                            onPressed: () {
                                              showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now());
                                            },
                                            child: Text(
                                              'hora',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ],
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(child: OutlinedButton(onPressed:, child: child)),
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(
                                  "Deseja realmente finalizar a reserva?",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 16),
                                ),
                                actions: [
                                  Center(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        OutlinedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blueAccent)),
                                          onPressed: () {
                                            Modular.to.pop();
                                          },
                                          child: Text(
                                            'CANCELAR',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blueAccent)),
                                          onPressed: () {
                                            Modular.get<UsuarioController>()
                                                .save(usuarioModel);
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Center(
                                                  child: Text(
                                                      'Reserva realizada com sucesso!!',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                content: Text(
                                                  "Em caso de cancelamento realize com 12 horas de antecedencia.",
                                                  textAlign: TextAlign.justify,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .blueAccent)),
                                                    onPressed: () {
                                                      Modular.to.navigate('/reservas');
                                                    },
                                                    child: Text(
                                                      'ok',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'FINALIZAR',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));

                      // DateTimeRange? result = await showDateRangePicker(
                      //   context: context,
                      //   firstDate: DateTime(2022, 1, 1),
                      //   lastDate: DateTime(2030, 12, 31),
                      //   currentDate: DateTime.now(),
                      //   saveText: 'Done',
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
