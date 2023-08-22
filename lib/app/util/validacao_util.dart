class ValidacaoUtil {
  static String? validarEmail(value) {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-z0-9-]+\.)+[a-z]{2,}$',
      caseSensitive: false,
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }
    if (value.length < 6) {
      return 'Email inválido';
    } else {
      return null;
    }
  }

  static String? validarSenha(value) {
    if (value.length < 4) {
      return 'Senha inválido';
    } else {
      return null;
    }
  }

  static String? validarCelular(value) {
    final cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanedNumber.length != 11) {
      return 'celular inválido';
    } else {
      return null;
    }
  }

  static DateTime? validarDataNasc(value) {
    if (value == null || value.isEmpty) {
      return validarDataNasc(Future.error('data inválida'));
    }

    final date = DateTime.parse(value);
    final now = DateTime.now();

    if (date.isAfter(now)) {
      return validarDataNasc(Future.error('data inválida'));
    }
    return null;
  }

  static String? validarCep(value) {
    return null;
  }
}
