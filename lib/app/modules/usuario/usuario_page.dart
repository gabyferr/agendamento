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
                Text(
                  'Selecione uma data e hora',
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  children: [
                    Card(
                      shadowColor: Colors.black,
                      child: ListTile(
                        title: Text(
                          'Nome do procedimento',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('informações'),
                        trailing: OutlinedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().addMonths(2),
                              );
                            },
                            child: Text('data')),
                      ),
                    ),
                  ],
                ),
                // Container(child: OutlinedButton(onPressed:, child: child)),
                Container(
                  child: OutlinedButton(
                    child: Text("CONTINUAR"),
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
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            Modular.to.pop();
                                          },
                                          child: Text('CANCELAR'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
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
                                                    onPressed: () {
                                                      Modular.get<
                                                              UsuarioController>()
                                                          .save(usuarioModel);
                                                    },
                                                    child: Text('ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Text('FINALIZAR'),
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
