import 'package:permanahome/models/paket_layanan_mode.dart';

class PermanaHomeNumber {
  final int? id;
  final PaketLayanan? paketLayanan;

  PermanaHomeNumber({
    this.id,
    this.paketLayanan,
  });

  factory PermanaHomeNumber.fromJson(Map<String, dynamic> json) =>
      PermanaHomeNumber(
        id: json['id'],
        paketLayanan: PaketLayanan.fromJson(
          json['paket_layanan'],
        ),
      );
}
