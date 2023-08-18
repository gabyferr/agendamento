import 'package:agendamento/app/modules/reservas/reserva_model.dart';
import 'package:agendamento/app/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({Key? key}) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  late ReservaModel reserva;

  @override
  void initState() {
    reserva = ReservaModel();
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateUtil.toBr(reserva.data),
                                    ),
                                    OutlinedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blueAccent)),
                                        onPressed: () async {
                                          reserva.data = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.now().addMonths(2),
                                          );
                                          setState(() {});
                                        },
                                        child: Text(
                                          "data",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(DateUtil.timeOfDayToHM(
                                            reserva.hora)),
                                        OutlinedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blueAccent)),
                                            onPressed: () async {
                                              reserva.hora =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              setState(() {});
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
                                  Wrap(
                                    runSpacing: 20,
                                    children: [ 
                                      Row(
                                      children: [            
                                        Container(
                                          padding: EdgeInsets.only(right: 10, left: 10),
                                          child: OutlinedButton(
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
                                        ),
                                        OutlinedButton(

                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blueAccent)),
                                          onPressed: () {
                                            // Modular.get<ReservaController>()
                                            //     .save(ReservaModel());
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
                                                      Modular.to.navigate(
                                                          '/reservas');
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
                                    ],
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
