import 'package:intl/intl.dart';

class DateUtil {
  static String toBr(DateTime? value) {
    if (value == null) {
      return 'Selecione ';
    }
    return DateFormat('dd/MM/yyyy', 'pt_BR').format(value);
  }
}
