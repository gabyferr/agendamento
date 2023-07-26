// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agendamento/app/modules/usuario/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UsuarioController {
  final CollectionReference service;
  UsuarioController(
    this.service,
  );

  save(UsuarioModel usuarioModel) async {
    await service.add(usuarioModel.toMap());
  }
}
