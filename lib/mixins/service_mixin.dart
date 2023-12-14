import 'dart:convert';

import 'package:http/http.dart' as http;

mixin ServiceMixin {
  final Uri baseUrl = Uri.parse('http://192.168.8.101:3502');

  Future<Map<String, dynamic>> get(String path) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(String path, dynamic body) async {
    try {
      final url = baseUrl.resolve(path);
      final response = await http.post(url, body: body);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(String path, dynamic body) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.put(url, body: json.encode(body));
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patch(String path, dynamic body) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.patch(url, body: json.encode(body));
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String path) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.delete(url);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
