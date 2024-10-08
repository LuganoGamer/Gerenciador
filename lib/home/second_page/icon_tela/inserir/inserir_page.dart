import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/second_page/resumo_page/resumo_page.dart';
import 'package:flutter_application_1/repository/db_helper.dart';
import 'package:flutter_application_1/shared/account_type.dart';
import 'package:flutter_application_1/shared/calendar.dart';
import 'package:flutter_application_1/model/ValorModel.dart';
import 'package:provider/provider.dart';

class InserirPage extends StatelessWidget {
  InserirPage({super.key});

  var _dateController = TextEditingController();
  var _valorController = TextEditingController();
  var _database = DbHelper();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Insira o valor desejado e o tipo de conta desejada',
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
              //controller: _valorController,
              keyboardType: TextInputType.number,
              controller: _controller,
            ),
            const SizedBox(height: 16),
            DropdownMenu<String>(
              dropdownMenuEntries: tiposDeConta
                  .map(
                    (item) => DropdownMenuEntry(value: item, label: item),
                  )
                  .toList(),
              hintText: 'Selecione um tipo de conta',
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
              onPressed: () async {
                double valorInserido = double.tryParse(_controller.text) ?? 0.0;
                Provider.of<ValorModel>(context, listen: false).setValor(valorInserido);
                //double valor = double.tryParse(_valorController.text) ?? 0.0;
                //await _database.inserirValor(ValorModel(valor: valor));
                //Navigator.pushNamed(context, '/resumo');
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
        ),
      ),
    );
  }
}
