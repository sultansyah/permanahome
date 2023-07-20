import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/formulir_instalasi_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class FormulirInstalasiService {
  Future<void> add(FormulirInstalasi data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/formulir-instalasi'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return;
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
