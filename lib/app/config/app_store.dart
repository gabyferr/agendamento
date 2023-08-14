import 'package:agendamento/app/modules/usuario/usuario_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AppStore {
  final userAtual = RxNotifier<UsuarioModel?>(null);
  void setUser(UsuarioModel? value) => userAtual.value = value;
  bool get isLogado => userAtual.value?.usuario != null;

  void deslogar() {
    setUser(null);
    Modular.to.navigate('/login');
  }
}
