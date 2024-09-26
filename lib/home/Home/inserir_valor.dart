import 'package:flutter/material.dart';

class InserirValor extends StatefulWidget {
  const InserirValor({super.key});

  @override
  State<InserirValor> createState() => _InserirValorState();
}

class _InserirValorState extends State<InserirValor> {
  final TextEditingController _valorController = TextEditingController();
  String? _selectedConta;
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
