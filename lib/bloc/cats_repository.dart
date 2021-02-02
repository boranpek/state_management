import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCats();
}

class SampleCatsRepository implements CatsRepository {
  final url = "https://hwasampleapi.firebaseio.com/http.json1";

  @override
  Future<List<Cat>> getCats() async {
    final response = await http.get(url);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) as List;
        return jsonBody.map((e) => Cat.fromJson(e)).toList();
      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;
  NetworkError(this.statusCode, this.message);
}
