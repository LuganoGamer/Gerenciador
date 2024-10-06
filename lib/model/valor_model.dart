class ValorModel {
  final int? id;
  final double valor;

  ValorModel({this.id, required this.valor});
  
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'valor': valor,
    };
  }

  factory ValorModel.fromMap(Map<String, dynamic>map){
    return ValorModel(
      id: map['id'],
      valor: map['valor'],
    );
  }
}