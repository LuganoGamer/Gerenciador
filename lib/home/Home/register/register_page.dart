import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

final _userController = TextEditingController();
final _passwordController = TextEditingController();
final _repetpasswordController = TextEditingController();

  void _clearFields() {
    _userController.clear();
    _passwordController.clear();
    _repetpasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Primeiro acesso?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Registre-se Aqui',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: 'Nome de Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _repetpasswordController,
              decoration: const InputDecoration(
                labelText: 'Repe a Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: BorderSide(color: Colors.grey),
              ),
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: (){
                _clearFields();
                Navigator.pushNamed(context, '/login');
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: BorderSide(color: Colors.grey),
              ), 
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
          ]
        )
      ),
    );
  }
}