class Tagihan {
  final int? id;
  final String? jumlahTagihan;
  final String? tanggalDibayar;
  final int? statusPembayaran;
  final String? createdAt;
  final String? tanggalAwalTagihan;
  final String? tanggalAkhirTagihan;

  Tagihan({
    this.id,
    this.jumlahTagihan,
    this.tanggalDibayar,
    this.statusPembayaran,
    this.createdAt,
    this.tanggalAwalTagihan,
    this.tanggalAkhirTagihan,
  });

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
        id: json['id'],
        jumlahTagihan: json['jumlah_tagihan'],
        tanggalDibayar: json['tanggal_dibayar'],
        statusPembayaran: json['status_pembayaran'],
        createdAt: json['created_at'],
        tanggalAwalTagihan: json['tanggal_awal_tagihan'],
        tanggalAkhirTagihan: json['tanggal_akhir_tagihan'],
      );
}
