import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/riwayat_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class RiwayatService {
  Future<List<Riwayat>> gets(int permanaHomeNumberId) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/riwayat/${permanaHomeNumberId}'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<Riwayat>.from(
          jsonDecode(res.body).map(
            (user) => Riwayat.fromJson(user),
          ),
        );
      } else if (jsonDecode(res.body)['messages']) {
        throw jsonDecode(res.body)['messages'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
