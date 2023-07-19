import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_model.dart';
import 'package:agendamento/app/util/validacao_util.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_date/dart_date.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({Key? key}) : super(key: key);

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
                      // DateTimeRange? result = await showDateRangePicker(
                      //   context: context,
                      //   firstDate: DateTime(2022, 1, 1),
                      //   lastDate: DateTime(2030, 12, 31),
                      //   currentDate: DateTime.now(),
                      //   saveText: 'Done',
                      // );
                      UsuarioModel usuarioModel = UsuarioModel();
                      final _formKey = GlobalKey<FormState>();

                      showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.6),
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            scrollable: false,
                            title: Center(child: Text('CADASTRO')),
                            content: Form(
                              key: _formKey,
                              child: SizedBox(
                                width: 600,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 5,
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "NOME SOBRENOME:",
                                          labelText: "NOME COMPLETO",
                                        ),
                                        onChanged: (value) {
                                          usuarioModel.nome = value;
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "user.user@gmail.com",
                                          labelText: "E-MAIL:",
                                        ),
                                        validator: (value) {
                                          return ValidacaoUtil.validarEmail(
                                              value);
                                        },
                                        onChanged: (value) {
                                          usuarioModel.email = value;
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 10,
                                      ),
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          TelefoneInputFormatter(),
                                        ],
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "(00)0000-0000",
                                          labelText: "CELULAR:",
                                        ),
                                        validator: (value) {
                                          return ValidacaoUtil.validarCelular(
                                              value);
                                        },
                                        onChanged: (value) {
                                          usuarioModel.celular = value;
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CpfInputFormatter(),
                                          ],
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "000.000.000-00",
                                            labelText: "CPF:",
                                          ),
                                          onChanged: (value) {
                                            usuarioModel.cpf = value;
                                          }),
                                    ),
                                    // Container(
                                    //   padding: const EdgeInsets.only(
                                    //     top: 10,
                                    //     bottom: 5,
                                    //   ),
                                    //   child: TextFormField(
                                    //       inputFormatters: [
                                    //         FilteringTextInputFormatter
                                    //             .digitsOnly,
                                    //         DataInputFormatter(),
                                    //       ],
                                    //       decoration: InputDecoration(
                                    //         border: OutlineInputBorder(),
                                    //         hintText: "DD-MM-AAAA",
                                    //         labelText: "DATA SE NACIMENTO:",
                                    //       ),
                                    //       validator: (value) {
                                    //         return ValidacaoUtil
                                    //             .validarDataNasc(value);
                                    //       },
                                    //       onChanged: (value) {
                                    //         usuarioModel.dataNacimento = value;
                                    //       }),
                                    // ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 0,
                                      ),
                                      child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CepInputFormatter(),
                                          ],
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "00.000-000",
                                            labelText: "CEP",
                                          ),
                                          validator: (value) {
                                            return ValidacaoUtil.validarCep(
                                                value);
                                          },
                                          onChanged: (value) {
                                            usuarioModel.cep = value;
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: Text('CANCELAR'),
                                onPressed: () {
                                  Modular.to.pop();
                                },
                              ),
                              ElevatedButton(
                                child: Text('FINALIZAR'),
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }

                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Center(
                                        child: Text(
                                            'Reserva realizada com sucesso!!',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      content: Text(
                                        "Em caso de cancelamento realize com 12 horas de antecedencia.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Modular.get<UsuarioController>()
                                                .save(usuarioModel);
                                          },
                                          child: Text('ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
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
