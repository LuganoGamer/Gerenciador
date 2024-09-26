// Função para selecionar data
import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context) async {
  var selectedDate = DateTime.now();
  return await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );
}
