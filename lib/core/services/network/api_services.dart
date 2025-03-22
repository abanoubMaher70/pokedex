import 'package:dio/dio.dart';

class ApiServices {
  ApiServices(this._dio);

  final Dio _dio;
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$_baseUrl/$endPoint');
    return response.data;
  }
}

///////////////////////////////////////
//End points
///////////////////////////////////////
//requset pokemon description by id
//https://pokeapi.co/api/v2/pokemon-species/{id or name}/


//filtring pokemons by there type
// https://pokeapi.co/api/v2/type/{type_name}