import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/pertanyaan_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class PertanyaanService {
  Future<List<Pertanyaan>> gets() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/pertanyaan'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<Pertanyaan>.from(
          jsonDecode(res.body).map(
            (user) => Pertanyaan.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
