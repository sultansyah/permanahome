class SignUpFormModel {
  final String? fullName;
  final String? email;
  final String? username;
  final String? password;
  // final String? profilePicture;
  final String? noHp;
  final String? noWa;

  SignUpFormModel({
    this.fullName,
    this.email,
    this.username,
    this.password,
    // this.profilePicture,
    this.noHp,
    this.noWa,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'username': username,
      'password': password,
      // 'profile_picture': profilePicture,
      'no_hp': noHp,
      'no_wa': noWa,
    };
  }

  SignUpFormModel copyWith({String? profilePicture}) => SignUpFormModel(
        fullName: fullName,
        email: email,
        username: username,
        password: password,
        // profilePicture: profilePicture ?? this.profilePicture,
        noHp: noHp,
        noWa: noWa,
      );
}
