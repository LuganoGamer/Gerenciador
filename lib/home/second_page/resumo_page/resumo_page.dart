import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/db_helper.dart';
import 'package:flutter_application_1/shared/calendar.dart';
import 'package:flutter_application_1/model/ValorModel.dart';
import 'package:provider/provider.dart';

class ResumoPage extends StatelessWidget {
  ResumoPage({super.key, this.valor = 0});

  var _dateController = TextEditingController();
  var _database = DbHelper();
  final double valor;

  @override
  /*Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
  */
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo'),
      ),

      body: Center(
        child: Consumer<ValorModel>(
          builder: (context, valorModel, child) {
            return Text(
              'Valor: ${valorModel.valor.toStringAsFixed(2)}',
              style: TextStyle(fontSize:24),
            );
          },
        ),
      ),
      /*body: FutureBuilder<List<ValorModel>>(
        future: _database.getValores(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar valores'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum valor cadastrado'));
          }

          final valores = snapshot.data!;

          return ListView.builder(
            itemCount: valores.length,
            itemBuilder: (context, index) {
              final valor = valores[index];
              return ListTile(
                title: Text('Valor: \$${valor.toStringAsFixed(2)}'),
              );
            }
          );
        }
      )*/
    );
  }
}

extension on ValorModel {
  toStringAsFixed(int i) {}
}
