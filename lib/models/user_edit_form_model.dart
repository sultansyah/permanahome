class UserEditFormModel {
  final String? fullName;
  final String? email;
  final String? username;
  final String? password;
  final String? noHp;
  final String? noWa;

  UserEditFormModel({
    this.fullName,
    this.email,
    this.username,
    this.password,
    this.noHp,
    this.noWa,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'username': username,
      'password': password,
      'no_hp': noHp,
      'no_wa': noWa,
    };
  }
}
