import 'dart:convert';

import 'package:flutter/foundation.dart';

class ValorModel with ChangeNotifier {
  double _valor = 0.0;
  ValorModel(this._valor);

  double get valor => _valor;

  void setValor(double novoValor) {
    _valor = novoValor;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      '_valor': _valor,
    };
  }

  factory ValorModel.fromMap(Map<String, dynamic> map) {
    return ValorModel(
      map['_valor']?.toDouble() ?? 0.0,
    );
  }
}
