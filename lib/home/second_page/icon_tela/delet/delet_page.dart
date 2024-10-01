import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/account_type.dart';
import 'package:flutter_application_1/shared/calendar.dart';

class DeletPage extends StatelessWidget {
  DeletPage({super.key});

  var _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selecione o tipo de conta a ser Deletado e selecione o mês a ser Deletado.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/resumo');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.grey),
              ),
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
          ],
        )
      ),
    );
  }
}
