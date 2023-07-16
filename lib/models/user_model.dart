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
    String? username,
    String? password,
    String? email,
    String? fullName,
    String? noHp,
    String? noWa,
    String? profilePicture,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        noHp: noHp ?? this.noHp,
        noWa: noWa ?? this.noWa,
        profilePicture: profilePicture,
        token: token,
      );
}
