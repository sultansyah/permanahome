import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/berita_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class BeritaService {
  Future<List<BeritaModel>> getBerita() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/berita'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<BeritaModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => BeritaModel.fromJson(tip),
          ),
        ).toList();
      }

      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
