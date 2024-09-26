import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/shared/account_type.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final _valorController = TextEditingController();
  var _selectedDate = DateTime.now();
  var _selectedConta = 'IPVA';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Valor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de Inserir Valor
            TextField(
              controller: _valorController,
              decoration: const InputDecoration(
                labelText: 'Inserir Valor',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Dropdown de Tipo de Conta
            DropdownButtonFormField<String>(
              value: _selectedConta,
              decoration: const InputDecoration(
                labelText: 'Tipo de Conta',
                border: OutlineInputBorder(),
              ),
              items: tiposDeConta.map((String conta) {
                return DropdownMenuItem<String>(
                  value: conta,
                  child: Text(conta),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedConta = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Campo de Data com ícone de calendário
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: DateFormat('dd/MM/yyyy').format(_selectedDate),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if(date != null){
                      _selectedDate = date;
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Botão de confirmação
            ElevatedButton(
              onPressed: () {
                // Lógica de submissão do valor
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
