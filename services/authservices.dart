import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final _storage = FlutterSecureStorage();
  final String baseUrl = 'https://server-ontime.onrender.com/api';

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      await _storage.write(key: 'token', value: token);
      final decoded = JwtDecoder.decode(token);
      return decoded['role'];
    }

    return null;
  }

  Future<String?> getRole() async {
    final token = await _storage.read(key: 'token');
    if (token == null) return null;
    final decoded = JwtDecoder.decode(token);
    return decoded['role'];
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }
}