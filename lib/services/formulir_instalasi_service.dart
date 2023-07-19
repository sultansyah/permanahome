import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:permanahome/models/formulir_instalasi_model.dart';
import 'package:permanahome/services/auth_service.dart';
import 'package:permanahome/shared/shared_values.dart';

class FormulirInstalasiService {
  Future<void> add(FormulirInstalasi data) async {
    try {
      print('name = ${data.fullName}');
      print('email = ${data.email}');
      print('hp = ${data.noHp}');
      print('wa = ${data.noWa}');
      print('ttd = ${data.tandaTangan}');
      print('ktp = ${data.ktp}');
      print('negara = ${data.negara}');
      print('provinsi = ${data.provinsi}');
      print('kota = ${data.kota}');
      print('alamat = ${data.alamatInstalasi}');
      print('kodepos = ${data.kodePos}');
      print('paketlayananid = ${data.paketLayananId}');

      final token = await AuthService().getToken();

      print(2);
      print('token = ${token}');

      final res = await http.post(
        Uri.parse('$baseUrl/formulir-instalasi'),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      print('u1');
      if (res.statusCode == 200) {
        return;
      }

      print(3);

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      print('eror = ${e.toString()}');
      rethrow;
    }
  }
}
