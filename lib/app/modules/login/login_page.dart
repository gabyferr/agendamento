import 'package:agendamento/app/modules/usuario/usuario_controller.dart';
import 'package:agendamento/app/modules/usuario/usuario_model.dart';
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
              height: 400,
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
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    UsuarioModel usuarioModel = UsuarioModel();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            height: 20,
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
            height: 18,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "***********:",
              labelText: "Senha",
            ),
            onChanged: (value) {
              usuarioModel.senha = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
            child: Text('Entrar'),
            onPressed: () {
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
    );
  }
}

class FormCadastro extends StatelessWidget {
  const FormCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    // );
    UsuarioModel usuarioModel = UsuarioModel();
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
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
                border: OutlineInputBorder(),
                hintText: "NOME SOBRENOME:",
                labelText: "NOME COMPLETO",
              ),
              onChanged: (value) {
                usuarioModel.nome = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "user.user@gmail.com",
                labelText: "E-MAIL:",
              ),
              validator: (value) {
                return ValidacaoUtil.validarEmail(value);
              },
              onChanged: (value) {
                usuarioModel.email = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "***********:",
                labelText: "Senha",
              ),
              onChanged: (value) {
                usuarioModel.senha = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "***********:",
                labelText: "Confirme Senha",
              ),
              onChanged: (value) {
                usuarioModel.senha = value;
              },
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "(00)0000-0000",
                labelText: "CELULAR:",
              ),
              validator: (value) {
                return ValidacaoUtil.validarCelular(value);
              },
              onChanged: (value) {
                usuarioModel.celular = value;
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
                  border: OutlineInputBorder(),
                  hintText: "000.000.000-00",
                  labelText: "CPF:",
                ),
                onChanged: (value) {
                  usuarioModel.cpf = value;
                }),
            SizedBox(
              height: 18,
            ),
            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "DD-MM-AAAA",
                  labelText: "DATA SE NACIMENTO:",
                ),
                validator: (value) {
                  return ValidacaoUtil.validarDataNasc(value);
                },
                onChanged: (value) {
                  usuarioModel.dataNacimento = value;
                }),
            SizedBox(
              height: 18,
            ),
            TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "00.000-000",
                  labelText: "CEP",
                ),
                validator: (value) {
                  return ValidacaoUtil.validarCep(value);
                },
                onChanged: (value) {
                  usuarioModel.cep = value;
                }),
            SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
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
