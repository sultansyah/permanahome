import 'dart:convert';

import 'package:permanahome/models/permintaan_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:permanahome/shared/shared_values.dart';

class PermintaanService {
  Future<void> add(Permintaan data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(Uri.parse('$baseUrl/permintaan'),
          body: data.toJson(),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        return;
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
