import 'dart:convert';

class Ponto {
  Ponto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.lat,
    required this.long,
    required this.tipo, //['Lixo', 'Donativo']
    required this.file,
  });

  String id;
  String nome;
  String descricao;
  String lat;
  String long;
  String tipo;
  String file;

  factory Ponto.fromJson(String str) => Ponto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ponto.fromMap(Map<String, dynamic> json) => Ponto(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"],
        lat: json["lat"],
        long: json["long"],
        tipo: json["tipo"],
        file: json["file"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "lat": lat,
        "long": long,
        "tipo": tipo,
        "file": file,
      };
}
