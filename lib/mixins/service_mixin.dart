import 'dart:convert';

import 'package:http/http.dart' as http;

mixin ServiceMixin {
  final Uri baseUrl = Uri.parse('http://192.168.8.101:3502');

  Map<String, String> buildHeaders(String token) {
    return {
      'Authorization': 'Bearer $token',
    };
  }

  Future<Map<String, dynamic>> get(String path,
      {Map<String, String>? headers}) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.get(url, headers: headers);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(String path,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      final url = baseUrl.resolve(path);
      final response = await http.post(url, headers: headers, body: body);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(String path,
      {dynamic body, Map<String, String>? headers}) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.put(url, headers: headers, body: body);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patch(String path,
      {dynamic body, Map<String, String>? headers}) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.patch(url, headers: headers, body: body);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String path,
      {Map<String, String>? headers}) async {
    final url = baseUrl.resolve(path);
    try {
      final response = await http.delete(url, headers: headers);
      return json.decode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
