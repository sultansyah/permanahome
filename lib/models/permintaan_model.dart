class Permintaan {
  final String? jenis;
  final String? deskripsi;
  final String? permanaHomeNumberId;

  Permintaan({
    this.jenis,
    this.deskripsi,
    this.permanaHomeNumberId,
  });

  Map<String, dynamic> toJson() {
    return {
      "jenis": jenis,
      "deskripsi": deskripsi,
      "permana_home_number_id": permanaHomeNumberId,
    };
  }
}
