import 'package:ecomap/api/CafeApi.dart';
import 'package:ecomap/models/ponto.dart';
import 'package:ecomap/models/http/ponto_response.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class PontoProvider extends ChangeNotifier {
  PontoProvider() {
    getPontos();
  }
  List<Ponto> pontos = [];

  getPontos() async {
    final resp = await CafeApi.httpGet("/pontos");
   final pontoResp = PontosResponse.fromMap(resp);

    pontos = [...pontoResp.pontos];

    notifyListeners();
  }

  Future newPonto(String nome) async {
    final data = {
      'nome': nome,
    };

    try {
      final json = await CafeApi.post('/pontos', data);

      final newponto = Ponto.fromMap(json);

      pontos.add(newponto);
      notifyListeners();
    } catch (e) {
      throw 'Erro ao criar a categoria ';
    }
  }

  Future updatePonto(String nome, String id) async {
    final data = {
      'nome': nome,
    };

    try {
      final json = await CafeApi.put('/pontos/$id', data);

      pontos = pontos.map((ponto) {
        if (ponto.id != id) return ponto;

        ponto.nome = nome;
        return ponto;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Erro ao atualizar a ponto ';
    }
  }

  Future delete(String id) async {
    try {
      await CafeApi.delete('/pontos/$id', {});
      pontos.removeWhere((ponto) => ponto.id == id);

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
