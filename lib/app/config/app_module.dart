// import 'package:agendamento/app/modules/reservas/home_reservas.dart';
import 'package:agendamento/app/modules/reservas/reserva_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../modules/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => ReservaController(
              FirebaseFirestore.instance.collection('reservas')),
        ),
        Bind(
          (i) => UsuarioController(
              FirebaseFirestore.instance.collection('usuario')),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/usuario', child: (context, args) => const UsuarioPage()),
        // ChildRoute('/reservas', child: (context, args) => StarBackground()),
      ];
}
