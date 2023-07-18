import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/paket_layanan_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class PaketLayananService {
  Future<List<PaketLayanan>> getAllByArea(String area) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/paket-layanan/$area'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<PaketLayanan>.from(
          jsonDecode(res.body).map(
            (user) => PaketLayanan.fromJson(user),
          ),
        );
      }

      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
