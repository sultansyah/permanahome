class Notifikasi {
  final int? id;
  final String? pesan;
  final String? permanaHomeNumberId;
  final String? createdAt;

  Notifikasi({
    this.id,
    this.pesan,
    this.permanaHomeNumberId,
    this.createdAt,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) => Notifikasi(
        id: json['id'],
        pesan: json['pesan'],
        permanaHomeNumberId: json['permana_home_number_id'].toString(),
        createdAt: json['created_at'],
      );
}
