class Ponto {
  int? id;
  String? nome;
  String? descricao;
  String? lat;
  String? long;
  String? tipo;
  String? file;

  Ponto(
      {this.id,
      this.nome,
      this.descricao,
      this.lat,
      this.long,
      this.tipo,
      this.file});

      factory Ponto.fromJson(Map<String, dynamic> item){
        return Ponto(
            id: item['id'],
            nome: item['nome'],
            descricao: item['descricao'],
            lat: item['lat'],
            long: item['long'],
            tipo: item['tipo'],
            file: item['file'],
          );
      }
}
