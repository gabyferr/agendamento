// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agendamento/app/modules/home/procedimetos_controller.dart';
import 'package:agendamento/app/modules/reservas/reserva_controller.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:agendamento/app/modules/home/procedimento_model.dart';
import 'package:agendamento/app/modules/reservas/reserva_model.dart';
import 'package:agendamento/app/util/date_util.dart';

class ReservaProcedimentoPage extends StatefulWidget {
  final ProcedimentoModel procedimento;
  ReservaProcedimentoPage({
    Key? key,
    required this.procedimento,
  }) : super(key: key);

  @override
  State<ReservaProcedimentoPage> createState() =>
      _ReservaProcedimentoPageState();
}

class _ReservaProcedimentoPageState extends State<ReservaProcedimentoPage> {
  late ReservaModel reserva;

  @override
  void initState() {
    reserva = ReservaModel(
      procedimento: widget.procedimento,
    );
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
                Container(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Card(
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Procedimento: ${reserva.procedimento?.nome}',
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
                            child: Text(
                                'Descrição: ${reserva.procedimento?.descricao}'),
                          ),
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
                          MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      modalContinuar();
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

  void modalContinuar() {
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
                              MaterialStateProperty.all(Colors.blueAccent)),
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: Text(
                        'CANCELAR',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                    onPressed: () async {
                      final result =
                          await Modular.get<ReservaController>().save(reserva);
                      if (!result) {
                        Modular.to.pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Nao foi possivel reservar!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
                        return;
                      }
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Center(
                            child: Text('Reserva realizada com sucesso!!',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                          content: Text(
                            "Em caso de cancelamento realize com 12 horas de antecedencia.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueAccent)),
                              onPressed: () {
                                Modular.to.navigate(
                                  '/reservas',
                                );
                              },
                              child: Text(
                                'ok',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'FINALIZAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
