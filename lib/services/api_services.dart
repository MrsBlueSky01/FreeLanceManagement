import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/project.dart'; // Model dosyanı import etmeyi unutma

class ApiService {
  // Bilgisayarından test ediyorsan (Android Emulator): 10.0.2.2
  // iOS Simülatör veya Web: localhost
  static const String baseUrl = 'http://localhost:5000/api/Project';

  Future<List<Project>> fetchProjects() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Project.fromJson(data)).toList();
      } else {
        throw Exception('Sunucu hatası: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Bağlantı hatası: $e');
    }
  }
}