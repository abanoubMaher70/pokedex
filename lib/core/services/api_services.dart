import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this._dio);

  final Dio _dio;
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$_baseUrl+$endPoint');
    return response.data;
  }
}


//End points
// https://pokeapi.co/api/v2/pokemon/{id or name}/
//https://pokeapi.co/api/v2/pokemon-species/{id or name}/