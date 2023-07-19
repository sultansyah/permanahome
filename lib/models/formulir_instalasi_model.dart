class FormulirInstalasi {
  final String? fullName;
  final String? email;
  final String? noHp;
  final String? noWa;
  final String? tandaTangan;
  final String? ktp;
  final String? negara;
  final String? provinsi;
  final String? kota;
  final String? alamatInstalasi;
  final String? kodePos;
  final int? paketLayananId;

  FormulirInstalasi({
    this.fullName,
    this.email,
    this.noHp,
    this.noWa,
    this.tandaTangan,
    this.ktp,
    this.negara,
    this.provinsi,
    this.kota,
    this.alamatInstalasi,
    this.kodePos,
    this.paketLayananId,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'no_hp': noHp,
      'no_wa': noWa,
      'tanda_tangan': tandaTangan,
      'ktp': ktp,
      'negara': negara,
      'provinsi': provinsi,
      'kota': kota,
      'alamat_instalasi': alamatInstalasi,
      'kode_pos': kodePos,
      'paket_layanan_id': paketLayananId.toString(),
    };
  }

  FormulirInstalasi copyWith({
    String? tandaTangan,
    String? ktp,
  }) =>
      FormulirInstalasi(
        fullName: fullName,
        email: email,
        noHp: noHp,
        noWa: noWa,
        tandaTangan: tandaTangan ?? this.tandaTangan,
        ktp: ktp ?? this.ktp,
        negara: negara,
        provinsi: provinsi,
        kota: kota,
        alamatInstalasi: alamatInstalasi,
        kodePos: kodePos,
        paketLayananId: paketLayananId,
      );
}
