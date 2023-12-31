// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:agendamento/app/modules/home/procedimento_model.dart';
import 'package:agendamento/app/modules/usuario/usuario_model.dart';

class ReservaModel {
  int? id;
  UsuarioModel? usuario;
  DateTime? data;
  TimeOfDay? hora;
  ProcedimentoModel? procedimento;

  ReservaModel({
    this.id,
    this.usuario,
    this.data,
    this.hora,
    this.procedimento,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usuario': usuario?.toMap(),
    };
  }

  factory ReservaModel.fromMap(Map<String, dynamic> map) {
    return ReservaModel(
      id: map['id'] != null ? map['id'] as int : null,
      usuario: map['usuario'] != null
          ? UsuarioModel.fromMap(map['usuario'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservaModel.fromJson(String source) =>
      ReservaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
