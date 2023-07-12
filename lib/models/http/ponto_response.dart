// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:ecomap/models/ponto.dart';

class PontosResponse {
  PontosResponse({
    required this.total,
    required this.pontos,
  });

  int total;
  List<Ponto> pontos;

  factory PontosResponse.fromJson(String str) =>
      PontosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PontosResponse.fromMap(Map<String, dynamic> json) =>
      PontosResponse(
        total: json["total"],
        pontos: List<Ponto>.from(
            json["pontos"].map((x) => Ponto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "pontos": List<dynamic>.from(pontos.map((x) => x.toMap())),
      };
}