class Pertanyaan {
  final String? judul;
  final String? konten;
  final String? createdAt;

  Pertanyaan({
    this.judul,
    this.konten,
    this.createdAt,
  });

  factory Pertanyaan.fromJson(Map<String, dynamic> json) => Pertanyaan(
        judul: json['judul'],
        konten: json['konten'],
        createdAt: json['created_at'],
      );
}
