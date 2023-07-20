import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/notifikasi_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class NotifikasiService {
  Future<List<Notifikasi>> gets({String? permanaHomeNumberId}) async {
    try {
      final token = await AuthService().getToken();

      String url = (permanaHomeNumberId != null)
          ? '$baseUrl/notifikasi/$permanaHomeNumberId'
          : '$baseUrl/notifikasi';

      final res = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<Notifikasi>.from(
          jsonDecode(res.body).map(
            (user) => Notifikasi.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
