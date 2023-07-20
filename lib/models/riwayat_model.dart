class Riwayat {
  final int? id;
  final String? jenis;
  final String? status;
  final String? deskripsi;
  final String? tanggalDiselesaikan;
  final String? tindakan;
  final int? permanaHomeNumberId;
  final String? createdAt;

  Riwayat({
    this.id,
    this.jenis,
    this.status,
    this.deskripsi,
    this.tanggalDiselesaikan,
    this.tindakan,
    this.permanaHomeNumberId,
    this.createdAt,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        id: json['id'],
        jenis: json['jenis'],
        status: json['status'],
        deskripsi: json['deskripsi'],
        tanggalDiselesaikan: json['tanggal_diselesaikan'],
        tindakan: json['tindakan'],
        permanaHomeNumberId: json['permana_home_number_id'],
        createdAt: json['created_at'],
      );
}
