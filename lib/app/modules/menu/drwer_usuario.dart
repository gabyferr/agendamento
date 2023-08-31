import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../usuario/usuario_model.dart';

class DrawerUsuario extends StatefulWidget {
  const DrawerUsuario({super.key});

  @override
  State<DrawerUsuario> createState() => _DrawerUsuarioState();
}

class _DrawerUsuarioState extends State<DrawerUsuario> {
  late UsuarioModel usuario;
  @override
  void initState() {
    usuario = UsuarioModel();
    super.initState();
  }
  
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Wrap(
              runAlignment: WrapAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle, size: 70, color: Colors.white),
                      Text(
                        "Nome Sobrenome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  "Meus dados",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Nome Completo:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Mari Cordeiro Silva",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "Minhas informações:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 50),
                    IconButton(onPressed: (){
                    modalEditar(context);
                    }, icon: Icon(Icons.edit)),
                  ],
                ),     
                SizedBox(height: 10),
                Divider(
                  height: 5,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "E-mal:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "Celular:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "CPF:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "Cep:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

modalEditar(context) {
  final _modalEditar = GlobalKey<FormState>();
  late UsuarioModel usuario;

  showDialog(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.only(bottom:90, left: 50, right: 50, top: 50,),
      child: Card(
        key: _modalEditar,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Wrap(
                runSpacing: 10.2,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    "Seus Dados",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                Column(
                  children: [
                          Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "E-mal:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "Celular:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextFormField(
                      strutStyle: StrutStyle(),
                      readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "CPF:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextFormField(
                    strutStyle: StrutStyle(),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: "Cep:",
                      contentPadding: EdgeInsets.all(2),
                    ),
                  ),
                ),
              ],
            ),
                 Container(
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                              onPressed: () {
                                if (!_modalEditar.currentState!.validate()) {
                                return;
                              }
                              // Modular.get<UsuarioController>().save(usuario);
                              Modular.to.pop();  
                              },
                      child: Text('Salvar',
                        style: TextStyle(
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
