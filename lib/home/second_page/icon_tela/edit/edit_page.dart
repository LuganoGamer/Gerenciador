import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});

  var _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selecione o tipo de conta a ser Editado e selecione o mês a ser Editado.',
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
                Navigator.pushNamed(context, '/inserir');
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
