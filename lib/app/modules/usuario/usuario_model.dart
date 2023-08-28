// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsuarioModel {
  int? id;
  String? nome;
  String? cpf;
  String? email;
  String? celular;
  DateTime? dataNacimento;
  String? cep;
  String? senha;

  UsuarioModel({
    this.id,
    this.nome,
    this.cpf,
    this.email,
    this.celular,
    this.dataNacimento,
    this.cep,
    this.senha,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'celular': celular,
      'dataNacimento': dataNacimento?.millisecondsSinceEpoch,
      'cep': cep,
      'senha': senha,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      celular: map['celular'] != null ? map['celular'] as String : null,
      dataNacimento: map['dataNacimento'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataNacimento'] as int)
          : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
