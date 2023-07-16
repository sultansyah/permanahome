class BeritaModel {
  final int? id;
  final String? judul;
  final String? konten;
  final String? gambar;
  final String? createdAt;

  BeritaModel({
    this.id,
    this.judul,
    this.konten,
    this.gambar,
    this.createdAt,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        id: json['id'],
        judul: json['judul'],
        konten: json['konten'],
        gambar: json['gambar'],
        createdAt: json['created_at'],
      );
}
