import 'package:agendamento/app/modules/reservas/reserva_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReservaController {
  final CollectionReference service;
  ReservaController(this.service);

  listAllByUser(int id) async {
    final resp = service.where('id', isEqualTo: id);
    final a = await resp.get();
    print(a.docs);
  }

  Future<bool> save(ReservaModel reserva) async {
    try {
      if (reserva.data == null || reserva.hora == null) {
        return false;
      }
      //validar o horario e data rstão disponiveis;
      await service.add(reserva.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  delete() {}
}
