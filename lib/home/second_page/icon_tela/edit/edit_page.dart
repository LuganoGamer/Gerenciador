import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

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
            const SizedBox(height: 32),
            TextFormField(
              decoration:  const InputDecoration(
                labelText: 'Tipo de Conta',
                border: OutlineInputBorder(),
              ),
            ),
             const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                
                border:  OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
