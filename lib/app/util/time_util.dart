import 'package:dart_date/dart_date.dart';


class TimeUtil {
  static String toHM (DateTime? value) {
    if (value == null) {
      return "Selecione hora";
    }
   return value.format("HH:mm");
  }
}
