class Tagihan {
  final int? id;
  final String? jumlahTagihan;
  final String? tanggalDibayar;
  final String? statusPembayaran;
  final String? createdAt;

  Tagihan({
    this.id,
    this.jumlahTagihan,
    this.tanggalDibayar,
    this.statusPembayaran,
    this.createdAt,
  });

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
        id: json['id'],
        jumlahTagihan: json['jumlah_tagihan'],
        tanggalDibayar: json['tanggal_dibayar'],
        statusPembayaran: json['status_pembayaran'],
        createdAt: json['created_at'],
      );
}
