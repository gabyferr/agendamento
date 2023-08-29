import 'package:agendamento/app/modules/home/procedimetos_controller.dart';
import 'package:agendamento/app/modules/menu/drawer_menu.dart';
import 'package:agendamento/app/modules/menu/drwer_usuario.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final minhaLista = ProcedimentoController().buscarProcedimentos();
  final ProcedimentoController procedimentoController =
      ProcedimentoController();
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          drawer: DrawerMenu(),
          endDrawer: DrawerUsuario(),
          appBar: AppBar(
            actions: <Widget>[
              IconButton(onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              }, icon: Icon(Icons.account_circle,
              size: 35,
              ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 35,
                ),
                child: const Text(
                  'PROCEDIMENTOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: minhaLista.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        minhaLista[index].nome,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        minhaLista[index].descricao,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Container(
                        width: 102,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Wrap(
                            spacing: 3,
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: const [
                              Text(
                                'Reservar',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.open_in_new,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/reservarProcedimento',
                            arguments: minhaLista[index]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
