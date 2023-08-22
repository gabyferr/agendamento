import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_model.dart';
import 'package:agendamento/app/util/date_util.dart';
import 'package:agendamento/app/util/validacao_util.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

final isFormLogin = RxNotifier<bool>(true);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 430,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: RxBuilder(builder: (context) {
                return isFormLogin.value ? FormLogin() : FormCadastro();
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class FormLogin extends StatelessWidget {
 FormLogin({super.key});

 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UsuarioModel usuarioModel = UsuarioModel();

    return Padding(
      padding: const EdgeInsets.all(20),
       key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Title(
                color: Colors.black,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "user.user@gmail.com",
                labelText: "Email",
              ),
              validator: (value) {
                return ValidacaoUtil.validarEmail(value);
              },
              onChanged: (value) {
                usuarioModel.email = value;
              },
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Senha",
              ),
              onChanged: (value) {
                usuarioModel.senha = value;
              },
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              child: Text('Entrar', style: TextStyle(color: Colors.white)),
              onPressed: () {
                // if (!_formKey.currentState!.validate()) {
                //     return;
                //   }
                Modular.get<UsuarioController>().logar(usuarioModel);
                Modular.to.navigate('/');
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text('Cadastrar'),
              onPressed: () {
                isFormLogin.value = false;
              },
            ),
          ],
        ),
      ),
    );
  }
}




class FormCadastro extends StatefulWidget {
  const FormCadastro({Key? key}) : super(key: key);

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  late UsuarioModel usuario;

  @override
  void initState() {
    usuario = UsuarioModel();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,

          shrinkWrap: true,
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: Title(
                  color: Colors.black,
                  child: Text(
                    'CADASTRO',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "NOME SOBRENOME:",
                labelText: "NOME COMPLETO",
              ),
              onChanged: (value) {
                usuario.nome = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "user.user@gmail.com",
                labelText: "E-MAIL:",
              ),
              validator: (value) {
                return ValidacaoUtil.validarEmail(value);
              },
              onChanged: (value) {
                usuario.email = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                labelText: "Senha",
              ),
              onChanged: (value) {
                usuario.senha = value;
              },
              validator: (value) {
                return ValidacaoUtil.validarSenha(value);
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                labelText: "Confirme Senha",
              ),
              onChanged: (value) {
                usuario.senha = value;
              },
              validator: (value) {
                return ValidacaoUtil.validarSenha(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "(00)0000-0000",
                labelText: "CELULAR:",
              ),
              validator: (value) {
                return ValidacaoUtil.validarCelular(value);
              },
              onChanged: (value) {
                usuario.celular = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "000.000.000-00",
                  labelText: "CPF:",
                ),
                onChanged: (value) {
                  usuario.cpf = value;
                }),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: TextEditingController(
                  text: DateUtil.toBr(usuario.dataNacimento)),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                labelText: "DATA SE NACIMENTO:",
              ),
              onTap: () async {
                usuario.dataNacimento = await showDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050),
                  context: context,
                );
                setState(() {});
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "00.000-000",
                  labelText: "CEP:",
                ),
                validator: (value) {
                  return ValidacaoUtil.validarCep(value);
                },
                onChanged: (value) {
                  usuario.cep = value;
                }),
            SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent)),
                child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  Modular.get<UsuarioController>().save(usuario);
                  isFormLogin.value = true;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                child: Text('Login'),
                onPressed: () {
                  isFormLogin.value = true;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
