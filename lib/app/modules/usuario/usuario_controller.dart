// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agendamento/app/modules/usuario/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioController {
  final CollectionReference service;
  final FirebaseFirestore firebaseFirestore;
  UsuarioController(
    this.service,
    this.firebaseFirestore,
  );

  save(UsuarioModel usuarioModel) async {
    usuarioModel.id = 50;
    await firebaseFirestore.collection('usuario').doc(usuarioModel.email!).set(usuarioModel.toMap());
        // await service.add(usuarioModel.toMap());
  }

  logar(UsuarioModel user) async {
    if (user.email == null || user.senha == null) {
      return ;
    }

    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user.email!, password: user.senha!);

  }
}
