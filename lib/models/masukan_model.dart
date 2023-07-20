class Masukan {
  final String? deskripsi;

  Masukan({
    this.deskripsi,
  });

  Map<String, dynamic> toJson() {
    return {
      "deskripsi": deskripsi,
    };
  }
}
