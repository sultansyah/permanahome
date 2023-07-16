class PaketLayanan {
  final int? id;
  final String? area;
  final String? nama;
  final String? deskripsi;
  final String? biaya;

  PaketLayanan({
    this.id,
    this.area,
    this.nama,
    this.deskripsi,
    this.biaya,
  });

  factory PaketLayanan.fromJson(Map<String, dynamic> json) => PaketLayanan(
        id: json['id'],
        area: json['area'],
        nama: json['nama'],
        deskripsi: json['deskripsi'],
        biaya: json['biaya'],
      );
}
