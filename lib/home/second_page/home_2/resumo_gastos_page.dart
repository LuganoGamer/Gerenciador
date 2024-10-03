import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/second_page/resumo_page/resumo_page.dart';
import 'package:flutter_application_1/home/second_page/icon_tela/delet/delet_page.dart';
import 'package:flutter_application_1/home/second_page/icon_tela/edit/edit_page.dart';
import 'package:flutter_application_1/home/second_page/icon_tela/inserir/inserir_page.dart';

class ResumoGastosPage extends StatefulWidget {
  const ResumoGastosPage({super.key});

  @override
  State<ResumoGastosPage> createState() => _ResumoGastosPageState();
}

class _ResumoGastosPageState extends State<ResumoGastosPage> {
  int _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final indexedStack = [
        ResumoPage(),
        InserirPage(),
        EditPage(),
        DeletPage(),
      ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo de Gastos'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _opcaoSelecionada,
          onTap: (opcao) {
            setState(() {
              _opcaoSelecionada = opcao;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
              label: 'Meus gastos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_download_outlined,
                size: 30,
                color: Colors.black,
              ),
              label: 'Inserir Valor',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
                size: 30,
                color: Colors.black,
              ),
              label: 'Editar Valor',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.delete_forever_sharp,
                size: 30,
                color: Colors.black,
              ),
              label: 'Excluir Valor',
            ),
          ]),
      body: indexedStack[_opcaoSelecionada],
    ); //);
  }
}
