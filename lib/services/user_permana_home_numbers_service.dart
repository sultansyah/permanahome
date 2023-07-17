import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/user_permana_home_number_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class UserPermanaHomeNumbersService {
  Future<List<UserPermanaHomeNumber>> get() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/user-permana-home-number'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<UserPermanaHomeNumber>.from(
          jsonDecode(res.body).map(
            (user) => UserPermanaHomeNumber.fromJson(user),
          ),
        );
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> add(int permanaHomeNumberId) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/user-permana-home-number'),
        body: {
          'permana_home_number_id': permanaHomeNumberId.toString(),
        },
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return true;
      }

      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateIsActive(int id) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/user-permana-home-number'),
        body: {
          "id": id.toString(),
        },
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return true;
      }

      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> delete(int id) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.delete(
        Uri.parse('$baseUrl/user-permana-home-number/${id.toString()}'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return true;
      }

      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
