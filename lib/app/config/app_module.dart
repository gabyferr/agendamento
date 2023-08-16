// import 'package:agendamento/app/modules/reservas/home_reservas.dart';
import 'package:agendamento/app/introducao/primeira_introducao_page.dart';
import 'package:agendamento/app/introducao/segunda_introducao_page.dart';
import 'package:agendamento/app/modules/login/login_page.dart';
import 'package:agendamento/app/modules/reservas/home_reservas.dart';
import 'package:agendamento/app/modules/reservas/reserva_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:agendamento/app/modules/reservas/dados_reserva_page.dart';
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
        ChildRoute('/login', child: (context, args) => const LoginPage()),
        ChildRoute('/reservas', child: (context, args) => HomeReservas()),
        ChildRoute('/intro1', child: (context, args) => const PrimeiraIntroPage()),
         ChildRoute('/intro2', child: (context, args) => const SegundaItroPage()),
      ];
}
