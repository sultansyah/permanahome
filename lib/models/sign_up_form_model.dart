class SignUpFormModel {
  final String? namaLengkap;
  final String? email;
  final String? username;
  final String? password;
  final String? alamat;
  final String? noHp;
  final String? noWa;
  final String? profilePicture;

  SignUpFormModel({
    this.namaLengkap,
    this.email,
    this.username,
    this.password,
    this.alamat,
    this.noHp,
    this.noWa,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama_lengkap': namaLengkap,
      'email': email,
      'username': username,
      'password': password,
      'alamat': alamat,
      'no_hp': noHp,
      'no_wa': noWa,
      'profile_picture': profilePicture,
    };
  }

  SignUpFormModel copyWith({String? profilePicture}) => SignUpFormModel(
        namaLengkap: namaLengkap,
        email: email,
        username: username,
        password: password,
        alamat: alamat,
        noHp: noHp,
        noWa: noWa,
        profilePicture: profilePicture ?? this.profilePicture,
      );
}
