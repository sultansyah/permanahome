class Pengaduan {
  final String? jenis;
  final String? deskripsi;
  final String? userId;
  final String? permanaHomeNumberId;

  Pengaduan({
    this.jenis,
    this.deskripsi,
    this.userId,
    this.permanaHomeNumberId,
  });

  Map<String, dynamic> toJson() {
    return {
      "jenis": jenis,
      "deskripsi": deskripsi,
      "user_id": userId,
      "permana_home_number_id": permanaHomeNumberId,
    };
  }
}
