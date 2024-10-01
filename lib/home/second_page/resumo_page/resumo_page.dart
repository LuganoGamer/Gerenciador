import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/calendar.dart';

class ResumoPage extends StatelessWidget {
  ResumoPage({super.key, this.valor = 0});

  var _dateController = TextEditingController();
  final double valor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffix: IconButton(
                    onPressed: () async {
                      final date = await selectDate(context);
                      if (date != null) {
                        _dateController.text =
                            formatDate(date, [mm, '-', yyyy]);
                      }
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Gastos até o momento: R\$ $valor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              )
            ])));
  }
}
