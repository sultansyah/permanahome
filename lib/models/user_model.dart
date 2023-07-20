class UserModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? username;
  final String? password;
  final String? profilePicture;
  final String? noHp;
  final String? noWa;
  final String? token;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.username,
    this.password,
    this.profilePicture,
    this.noHp,
    this.noWa,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'username': username,
      'password': password,
      'no_hp': noHp,
      'no_wa': noWa,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        fullName: json['full_name'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        profilePicture: json['profile_picture'],
        noHp: json['no_hp'],
        noWa: json['no_wa'],
        token: json['token'],
      );

  UserModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? username,
    String? password,
    String? noHp,
    String? noWa,
    String? profilePicture,
  }) =>
      UserModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        noHp: noHp ?? this.noHp,
        noWa: noWa ?? this.noWa,
        profilePicture: profilePicture,
        token: token,
      );
}
