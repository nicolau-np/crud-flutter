import 'package:ecomap/model/api_response.dart';
import 'package:ecomap/model/ponto.dart';
//import 'package:http/http.dart' as http;
//import 'package:http_client/http_client.dart' as http;
import 'package:dio/dio.dart';

class PontoService {
  static const API = 'http://localhost:8000/api';
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<ApiResponse<List<Ponto>>> getPontosList() async {
    try {
      final response =
          await Dio().get("$API/pontos", options: Options(headers: headers));

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final pontos = <Ponto>[];

        for (var item in jsonData) {
          pontos.add(Ponto.fromJson(item));
        }
        return ApiResponse<List<Ponto>>(
          data: pontos,
        );
      }
      return ApiResponse<List<Ponto>>(
        error: true,
        errorMessage: 'An error occurred',
      );
    } catch (error) {
      return ApiResponse<List<Ponto>>(
        error: true,
        errorMessage: 'An error occurred',
      );
    }
  }

  Future<ApiResponse<Ponto>> getPonto(int id) async {
    try {
      final response =
          await Dio().get("$API/pontos/$id", options: Options(headers: headers));

      if (response.statusCode == 200) {
        final jsonData = response.data;
        
        return ApiResponse<Ponto>(
          data: Ponto.fromJson(jsonData),
        );
      }
      return ApiResponse<Ponto>(
        error: true,
        errorMessage: 'An error occurred',
      );
    } catch (error) {
      return ApiResponse<Ponto>(
        error: true,
        errorMessage: 'An error occurred',
      );
    }
  }

  /*Future<ApiResponse<List<Ponto>>> getPontosList() {
    return agua.get(Uri.parse("$API/pontos"), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final pontos = <Ponto>[];

        for (var item in jsonData) {
          final ponto = Ponto(
            id: item['id'],
            nome: item['nome'],
            descricao: item['descricao'],
            lat: item['lat'],
            long: item['long'],
            tipo: item['tipo'],
            file: item['file'],
          );
          pontos.add(ponto);
        }
        return ApiResponse<List<Ponto>>(
          data: pontos,
        );
      }
      return ApiResponse<List<Ponto>>(
        error: true,
        errorMessage: 'any error ocurred',
      );
    }).catchError((_)=>ApiResponse<List<Ponto>>(
        error: true,
        errorMessage: 'any error ocurred',
      ));
  }*/
}
