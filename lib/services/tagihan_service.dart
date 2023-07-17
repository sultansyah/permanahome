import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/tagihan_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class TagihanService {
  Future<Tagihan> getLatestTagihan(int permanaHomeNumberId) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tagihan/latest/$permanaHomeNumberId'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        Tagihan tagihan = Tagihan.fromJson(jsonDecode(res.body));
        return tagihan;
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tagihan>> gets() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tagihan/latest'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<Tagihan>.from(
          jsonDecode(res.body).map(
            (tagih) => Tagihan.fromJson(tagih),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
