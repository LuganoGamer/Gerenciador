import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/account_type.dart';
import 'package:flutter_application_1/shared/calendar.dart';

class InserirPage extends StatelessWidget {
  InserirPage({super.key});

  var _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Insira o valor desejado para a o tipo de conta desejada',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Inserir Valor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownMenu<String>(
              dropdownMenuEntries: tiposDeConta
                  .map(
                    (item) => DropdownMenuEntry(value: item, label: item),
                  )
                  .toList(),
              hintText: 'Selecione uma tipo de conta',
              expandedInsets: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffix: IconButton(
                  onPressed: () async{
                    final date = await selectDate(context);
                    if(date != null){

                    _dateController.text = formatDate(date, [mm, '-', yyyy]);
                    }
                  },
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
