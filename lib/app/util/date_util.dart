import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static String toBr(DateTime? value) {
    if (value == null) {
      return 'Selecione data';
    }
    return DateFormat('dd/MM/yyyy', 'pt_BR').format(value);
  }

  static String timeOfDayToHM(TimeOfDay? value) {
    if (value == null) {
      return "Selecione hora";
    }
    return '${value.hour} : ${value.minute}';
  }
}
